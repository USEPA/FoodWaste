# views.py (projects)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov
# py-lint: disable=C0301,R0901,E1101,R0912

"""
Project management views.

Available functions:
- Create the form view
- View to edit a project's details
- Project Management Form
"""

from rest_framework.response import Response
from rest_framework.views import APIView
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
from django.utils.decorators import method_decorator
from django.shortcuts import render
from django.views.generic import ListView, DetailView, \
    UpdateView, CreateView
from projects.forms import ProjectForm
from projects.models import Project, ProjectSharingTeamMap, CenterOffice, \
    Division, Branch
from projects.serializers import CenterSerializer, DivisionSerializer, \
    BranchSerializer
from teams.models import TeamMembership


def is_user_project_lead(user, project=None):
    """
    Check if a User is the lead for the given project.

    Also checks if the User is project lead for any project when project=None.
    """
    if project:
        return Project.objects.filter(
            id=project.id, project_lead_id=user.id).exists()
    return Project.objects.filter(project_lead_id=user.id).exists()


def get_projects_for_user(user):
    """
    Get all Projects belonging to a user.

    - of which the provided user is a member.
    - logic filters for the user's non-member teams
    - then excludes those teams from the data results.
    - This is necessary because there is no direct connection between data
    - model users and project instances. The relation here is through
    - the teams model.
    """
    include_teams = TeamMembership.objects.filter(
        member=user).values_list('team', flat=True)
    exclude_teams = TeamMembership.objects.exclude(
        team__in=include_teams).distinct().values_list('team', flat=True)
    exclude_data = ProjectSharingTeamMap.objects.filter(
        team__in=exclude_teams).values_list('project', flat=True)

    return Project.objects.exclude(id__in=exclude_data)


def check_can_edit(project, user):
    """
    Check if the provided user can edit the provided project.

    All of the user's member teams are checked as well as the user's
    super user status or project ownership status.
    """
    # Check if any of the user's teams have edit privilege:
    user_teams = TeamMembership.objects.filter(
        member=user).values_list('team', flat=True)

    for team in user_teams:
        data_team_map = ProjectSharingTeamMap.objects.filter(
            project=project, team=team).first()
        if data_team_map and data_team_map.can_edit:
            return True

    # Check if the user is super or owns the project:
    if user.is_superuser:
        return True

    # Since this is the last check, the project is either owned by
    # the user, or the user does not have edit privilege at all:
    return project.created_by == user or project.project_lead == user


class ProjectListView(LoginRequiredMixin, ListView):
    """
    New class to return a projects list view.

    This will serve as the management view where users can view, edit,
    and create new projects.
    """

    model = Project
    context_object_name = 'projects'
    template_name = 'project_list.html'

    def get_queryset(self):
        """Return a list of projects for the requesting user."""
        return get_projects_for_user(self.request.user)


class ProjectEditView(LoginRequiredMixin, UpdateView):
    """View for editing the details of an existing Project instance."""

    model = Project
    form_class = ProjectForm
    template_name = 'project_edit.html'

    def get(self, request, *args, **kwargs):
        """
        Override default get request.

        So we can verify the user has edit privileges, either through super
        status or team membership.
        """
        pk = kwargs.get('pk')
        proj = Project.objects.filter(id=pk).first()
        if check_can_edit(proj, request.user):
            # TODO: Fix return form:
            return render(request, self.template_name,
                          {'object': proj, 'form': ProjectForm(instance=proj)})

        reason = 'You don\'t have edit permissions for this Project!'
        return HttpResponseRedirect('/projects/detail/%s' % pk, 401, reason)

    def form_valid(self, form):
        """Project Edit Form validation and redirect."""
        # Verify the current user has permissions to modify this Project:
        self.object = form.save(commit=False)
        self.object.save()
        # Prepare and insert teams data.
        if form.cleaned_data['teams']:
            form_teams = form.cleaned_data['teams']

            # Remove any team maps that have been deselected:
            remove_teams = ProjectSharingTeamMap.objects.filter(
                project=self.object).exclude(team__in=form_teams)

            for team in remove_teams:
                team.delete()

            # Insert or update selected team maps:
            for team in form_teams:
                data_team_map = ProjectSharingTeamMap.objects.filter(
                    project=self.object, team=team).first()
                # Create new team map if not exists:
                if not data_team_map:
                    data_team_map = ProjectSharingTeamMap()
                    data_team_map.team = team
                    data_team_map.project = self.object
                # Update (or set) the can_edit field:
                data_team_map.can_edit = form.cleaned_data['can_edit']
                data_team_map.save()
        # Return back to the details page:
        return HttpResponseRedirect('/projects/detail/' + str(self.object.id))


class ProjectCreateView(LoginRequiredMixin, CreateView):
    """Class for creating new Projects."""

    model = Project
    template_name = 'project_create.html'

    @method_decorator(login_required)
    def get(self, request, *args, **kwargs):
        """Return a view with an empty form for creating a new Project."""
        # Set initial project_lead to current user
        form = ProjectForm(initial={'project_lead': request.user},
                           user=request.user)
        return render(request, 'project_create.html', {'form': form})

    @method_decorator(login_required)
    def post(self, request, *args, **kwargs):
        """Process the post request with a new Project form filled out."""
        form = ProjectForm(request.POST, user=request.user)
        if form.is_valid():
            obj = form.save(commit=False)
            # Assign current user as the prepared_by
            obj.created_by = request.user
            obj.save()
            # Prepare and insert teams data.
            if form.cleaned_data['teams']:
                for team in form.cleaned_data['teams']:
                    data_team_map = ProjectSharingTeamMap()
                    data_team_map.can_edit = form.cleaned_data['can_edit']
                    data_team_map.team = team
                    data_team_map.project = obj
                    data_team_map.save()

            return HttpResponseRedirect('/projects/detail/%d' % obj.id)

        return render(request, 'project_create.html', {'form': form})


class ProjectDetailView(LoginRequiredMixin, DetailView):
    """Class for viewing an existing (newly created) Project."""

    model = Project
    template_name = 'project_detail.html'

    def get_context_data(self, **kwargs):
        """
        Get the view's context data.

        Add an edit message to the returned context if the requesting user
        does not have Project edit permissions.
        """
        context = super().get_context_data(**kwargs)
        if not check_can_edit(context['object'], self.request.user):
            context['edit_message'] = \
                'You don\'t have edit permissions for this Project!'
        return context


class APICentersListView(LoginRequiredMixin, APIView):
    """Get a JSON list of Centers/Offices (GET) for the given Office ID."""

    def get(self, request, *args, **kwargs):
        """Return all teams the current user is a member of."""
        pk = kwargs.get('pk', None)
        centers = CenterOffice.objects.filter(office_id=pk).all()
        serializer = CenterSerializer(centers, many=True)
        return Response(serializer.data)


class APIDivisionsListView(LoginRequiredMixin, APIView):
    """Get a JSON list of Centers/Offices (GET) for the given Office ID."""

    def get(self, request, *args, **kwargs):
        """Return all teams the current user is a member of."""
        pk = kwargs.get('pk', None)
        divisions = Division.objects.filter(center_office_id=pk).all()
        serializer = DivisionSerializer(divisions, many=True)
        return Response(serializer.data)


class APIBranchesListView(LoginRequiredMixin, APIView):
    """Get a JSON list of Centers/Offices (GET) for the given Office ID."""

    def get(self, request, *args, **kwargs):
        """Return all teams the current user is a member of."""
        pk = kwargs.get('pk', None)
        branches = Branch.objects.filter(division_id=pk).all()
        serializer = BranchSerializer(branches, many=True)
        return Response(serializer.data)


# #########################################################################
# Only let super or staff users create Offices, CenterOffices, Divisions,
# and Branches. The rest of this file will be these staff/super only views.

# Alternatively, rely on the Django Admin portal to create and manage these
# objects.

# class OfficeListView(LoginRequiredMixin, ListView):
# class OfficeCreateView(LoginRequiredMixin, CreateView):
# class OfficeEditView(LoginRequiredMixin, EditView):
# class OfficeDeleteView(LoginRequiredMixin, DeleteView):

# class CenterOfficeListView(LoginRequiredMixin, ListView):
# class CenterOfficeCreateView(LoginRequiredMixin, CreateView):
# class CenterOfficeEditView(LoginRequiredMixin, EditView):
# class CenterOfficeDeleteView(LoginRequiredMixin, DeleteView):

# class DivisionListView(LoginRequiredMixin, ListView):
# class DivisionCreateView(LoginRequiredMixin, CreateView):
# class DivisionEditView(LoginRequiredMixin, EditView):
# class DivisionDeleteView(LoginRequiredMixin, DeleteView):

# class BranchListView(LoginRequiredMixin, ListView):
# class BranchCreateView(LoginRequiredMixin, CreateView):
# class BranchEditView(LoginRequiredMixin, EditView):
# class BranchDeleteView(LoginRequiredMixin, DeleteView):
