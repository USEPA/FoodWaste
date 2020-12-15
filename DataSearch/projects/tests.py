# # tests.py (projects)
# # !/usr/bin/env python3
# # coding=utf-8
# # young.daniel@epa.gov
# # py-lint: disable=C0301

"""
Project test cases.

Available functions:
- TBD
"""

# from django.contrib.auth.models import User
# from django.test import Client, TestCase
# from projects.forms import TeamManagementForm


# class TestTeams(TestCase):
#     """Tests for the Projects module."""

#     def setUp(self):
#         """Prepare necessary objects for testing the Projects module."""
#         self.type_texture = "1"
#         self.client = Client()
#         self.user = User.objects.create_user(
#             username='testuser', password='12345')
#         self.client.login(username='testuser', password='12345')

#     def test_team_create_view_get(self):
#         """Tests the Project Create View get method on an empty form."""
#         response = self.client.get("/projects/project/")
#         self.assertContains(response, 'create', 2, 200)

#     def test_team_create_view_post(self):
#         """Tests the Project Create View post method on an empty form."""
#         response = self.client.post("/projects/project/")
#         self.assertContains(response, 'create', 2, 200)

#     def test_team_create_view_post_with_form(self):
#         """Tests the Project Create View post method."""
#         form = TeamManagementForm(data={'name': "test1"})
#         self.assertTrue(form.is_valid())
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         self.assertEqual(results.status_code, 302)

#     def test_team_edit_view_get(self):
#         """Tests the Project Edit View get method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.get(
#             "/projects/project/" + url_object_number + "/edit")
#         self.assertContains(response, 'edit', 1, 200)

#     def test_team_edit_view_get_two(self):
#         """Tests the Project Edit View get method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.get(
#             "/projects/project/" + url_object_number + "/edit",
#             {"team_id": ""})
#         self.assertContains(response, 'edit', 1, 200)

#     def test_team_edit_view_post(self):
#         """Tests the Project edit View post method on an empty form."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.post(
#             "/projects/project/" + url_object_number + "/edit",
#             {'name': "test2"})
#         self.assertContains(response, 'edit', 1, 200)

#     def test_team_edit_view_post_two(self):
#         """Tests the Project edit View post method on an empty form."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.post(
#             "/projects/project/" + url_object_number + "/edit", {'name': ""})
#         self.assertContains(response, 'edit', 1, 200)

#     def test_team_management_view_get(self):
#         """Tests the Project Management View get method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})

#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.get(
#             "/projects/project/" + url_object_number + "/manage")
#         self.assertContains(response, 'manage', 3, 200)

#     def test_team_management_view_post_one(self):
#         """Tests the Project management View post method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.post(
#             "/projects/project/" + url_object_number + "/manage",
#             {'command': "adduser"})
#         self.assertContains(response, 'manage', 3, 200)

#     def test_team_management_view_post_two(self):
#         """Tests the Project management View post adduser method."""
#         # Create a project:
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         # Get ID of the new project:
#         url_object_number = create_url_split_array[4]
#         # Manage the project, adding a new user.
#         response = self.client.post(
#             "/projects/project/" + url_object_number + "/manage",
#             {'command': "adduser", 'team_id': "", 'member_id': "user2"})
#         self.assertContains(response, 'manage', 3, 200)

#     def test_team_management_view_post_three(self):
#         """Tests the Project management View post method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.post(
#             "/projects/project/" + url_object_number + "/manage",
#             {'command': "deleteuser"})
#         self.assertContains(response, 'manage', 3, 200)

#     def test_api_team_list_view_get(self):
#         """Tests the Project list View get method."""
#         results = self.client.get("/projects/api/project/")
#         self.assertContains(results, "id", 0, 200)

#     def test_api_team_list_view_post(self):
#         """Tests the Project list View post method."""
#         # Results = self.client.post("/projects/project/", {'name': "test1"})
#         response = self.client.post(
#             "/projects/api/project/", {'name': "test1"})
#         self.assertContains(response, "id", 5, 201)

#     def test_api_team_list_view_post_two(self):
#         """Tests the Project list View post method."""
#         response = self.client.post("/projects/api/project/", {'name': ""})
#         self.assertContains(response, "id", 0, 400)

#     def test_api_team_membership_list_view_get(self):
#         """Tests the Project membership list view get method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.get(
#             "/projects/api/project/" + url_object_number + "/membership/")
#         self.assertContains(response, "id", 2, 200)

#     def test_api_team_membership_list_view_put(self):
#         """Tests the Project membership list view put method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.put(
#             "/projects/api/project/" + url_object_number + "/membership/")
#         self.assertContains(response, "id", 0, 405)

#     def test_api_team_detail_list_view_get(self):
#         """Tests the Project detail list View get method."""
#         results = self.client.post("/projects/project/", {'name': "test1"})
#         create_url = str(results)
#         create_url_split_array = create_url.split("/")
#         url_object_number = create_url_split_array[4]
#         response = self.client.get(
#             "/projects/api/project/" + url_object_number + "/")
#         self.assertContains(response, "id", 5, 200)
