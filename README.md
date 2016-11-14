# Hunting Unicorns With Goblin Tech: A Quick Start Guide

[![Documentation Status](https://readthedocs.org/projects/hunting-unicorns/badge/?version=latest)](http://hunting-unicorns.readthedocs.io/en/latest/?badge=latest)

These docs are written in [reStructuredText](http://sphinx-doc.org/rest.html) and are built with [Sphinx](http://www.sphinx-doc.org/) using the [Read the Docs theme](https://github.com/snide/sphinx_rtd_theme).

## Prerequisites

You can install the required Python modules like so:

```
$ pip install sphinx sphinx_rtd_theme
```

If you don't have `pip` installed, consult [the Python docs](https://packaging.python.org/installing/) for more help.

## Building

You can trigger a single HTML build like so:

```
$ make html
```

If you're editing the docs, you can get automatic build updates like so:

```
$ sphinx-autobuild . _build/html
```

## Contributing

Have experience hunting unicorns? Tried something in this guide that didn't work or could be improved? We want your contribution! Open an issue or send a PR.

## License

Copyright 2016, Noah Slater and contributors. This work is licensed under a [Creative Commons Attribution 4.0 International License](http://creativecommons.org/licenses/by/4.0/).
