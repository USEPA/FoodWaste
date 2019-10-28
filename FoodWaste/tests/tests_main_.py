# tests_main_.py (tests)
# !/usr/bin/env python3
# coding=utf-8
# young.daniel@epa.gov

# emacs: -*- mode: python; py-indent-offset: 4; tab-width: 4; indent-tabs-mode: nil -*-
# ex: set sts=4 ts=4 sw=4 noet:
# See COPYING file distributed along with the duecredit package for the
# copyright and license terms.

"""
Tests were taken from https://github.com/duecredit/duecredit/tree/master/duecredit/tests.
"""

from django.test import TestCase
import sys
import pytest
from six.moves import StringIO
from .. import __main__, __version__
from .. import due


def test_main_help(monkeypatch):
    """Patch stdout."""
    fakestdout = StringIO()
    monkeypatch.setattr(sys, "stdout", fakestdout)

    pytest.raises(SystemExit, __main__.main, ['__main__.py', '--help'])
    assert(
        fakestdout.getvalue().startswith(
            "Usage: %s -m duecredit [OPTIONS] <file> [ARGS]\n" % sys.executable))


def test_main_version(monkeypatch):
    """Patch stdout."""
    fakestdout = StringIO()
    monkeypatch.setattr(sys, "stdout", fakestdout)

    pytest.raises(SystemExit, __main__.main, ['__main__.py', '--version'])
    assert fakestdout.getvalue().rstrip() == "duecredit %s" % __version__


def test_main_run_a_script(tmpdir, monkeypatch):
    """Add docstring."""  # TODO add docstring.
    tempfile = str(tmpdir.mkdir("sub").join("tempfile.txt"))
    content = b'print("Running the script")\n'
    with open(tempfile, 'wb') as f:
        f.write(content)

    # Patch stdout
    fakestdout = StringIO()
    monkeypatch.setattr(sys, "stdout", fakestdout)

    # Patch due.activate
    count = [0]

    def count_calls(*args, **kwargs):
        count[0] += 1

    monkeypatch.setattr(due, "activate", count_calls)

    __main__.main(['__main__.py', tempfile])
    assert fakestdout.getvalue().rstrip() == "Running the script"

    # And we have "activated" the due
    assert count[0] == 1
