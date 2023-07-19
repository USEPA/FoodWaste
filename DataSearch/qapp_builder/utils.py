
# utils.py (qapp_builder)
# !/usr/bin/env python3
# coding=utf-8

"""Utility methods."""

from qapp_builder import constants as CONST


def get_steps(ctx, current_step):
    """
    Add Scenario creation step statuses to the provided context.

    Args:
        ctx (dict): the view's context which is modified and returned
        current_step (int): the current step's index in ALL_SCENARIO_FIELDS

    Returns:
        dict: ctx, the view's context
    """

    for idx, field in enumerate(CONST.ALL_SCENARIO_FIELDS):
        if idx is current_step:  # idx == current
            ctx[f'{field}_status_css'] = CONST.CURRENT_CSS

        elif idx > current_step:  # idx > current
            ctx[f'{field}_status_span'] = CONST.INCOMPLETE_SPAN

        else:  # idx < current
            ctx[f'{field}_status_css'] = CONST.COMPLETE_CSS
            ctx[f'{field}_status_span'] = CONST.COMPLETE_SPAN

    return ctx
