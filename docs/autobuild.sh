#!/bin/sh -e

# This build script mirrors the autobuild instructions in the `README.md` file

PY="python3"

if test ! -d _venv; then
	"${PY}" -m venv _venv
	"_venv/bin/${PY}" -m pip install --upgrade pip
	"_venv/bin/${PY}" -m pip install -r requirements.txt
	"_venv/bin/${PY}" -m pip install sphinx-autobuild
fi

_venv/bin/sphinx-autobuild --open-browser --delay 1 -b html . _out
