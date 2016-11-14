# Hunting Unicorns With Goblin Tech: A Quick Start Guide

These docs are written in [reStructuredText](http://sphinx-doc.org/rest.html) and are built with [Sphinx](http://www.sphinx-doc.org/) using the [Read the Docs theme](https://github.com/snide/sphinx_rtd_theme).

# Set Up

You can install the required Python modules like so:

```
$ pip install sphinx sphinx_rtd_theme
```

If you don't have `pip` installed, consult [the Python docs](https://packaging.python.org/installing/) for more help.

# Building

You can trigger a single HTML build like so:

```
$ make html
```

If you're editing the docs, you can get automatic build updates like so:

```
$ sphinx-autobuild . _build/html
```
