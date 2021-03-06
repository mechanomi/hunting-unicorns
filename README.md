# Hunting Unicorns With Goblin Technology: A Quick Start Guide

[![Build status](https://readthedocs.org/projects/hunting-unicorns/badge/?version=latest)](https://readthedocs.org/projects/hunting-unicorns/badge/?version=latest) [![Total alerts](https://img.shields.io/lgtm/alerts/g/norosa/hunting-unicorns.svg?logo=lgtm&logoWidth=18)](https://lgtm.com/projects/g/norosa/hunting-unicorns/alerts/)

This documentation project is written in [reStructuredText](http://sphinx-doc.org/rest.html) (RST) and is built using [Sphinx](http://www.sphinx-doc.org/) with the [Read the Docs theme](https://github.com/snide/sphinx_rtd_theme).

The [live docs](https://hunting-unicorns.readthedocs.io/) are hosted on RTD:

[![Screenshot of the live docs](screenshot.png)](https://hunting-unicorns.readthedocs.io/)

**Table of contents**

  * [Build](#build)
    + [Build requirements](#build-requirements)
    + [Build methods](#build-methods)
      - [Manual build](#manual-build)
      - [Autobuild with live reloads](#autobuild-with-live-reloads)
    + [Build script](#build-script)
    + [Troubleshooting the build](#troubleshooting-the-build)
  * [Continuous integration](#continuous-integration)
  * [Contributing](#contributing)
  * [License](#license)

## Build

### Build requirements

To build the docs locally, you must have [Python 3](https://www.python.org/downloads/) installed.

Change into the [docs](https://github.com/norosa/hunting-unicorns/tree/main/docs) directory:

```console
$ cd docs
```

We recommend that you create a Python [virtual environment](https://docs.python.org/3/tutorial/venv.html) to install and manage the build [requirements](https://github.com/norosa/hunting-unicorns/tree/main/docs/requirements.txt).

You can create a new virtual environment with the [venv](https://docs.python.org/3/library/venv.html)  module, like so:

```console
$ python3 -m venv _venv
```

After creating the virtual environment, make sure [pip](https://pypi.org/project/pip/) is up-to-date:

```console
$ _venv/bin/python3 -m pip install --upgrade pip
```

Then, install the requirements:

```console
$ _venv/bin/python3 -m pip install -r requirements.txt
```

### Build methods

#### Manual build

The [sphinx-build](https://www.sphinx-doc.org/en/3.x/man/sphinx-build.html) program (which has already been installed into your virtual environment if you followed the instructions above) can generate a static HTML site from the RST source files. RTD uses this program to build the docs on their infrastructure whenever the `main` branch (or a pull request) receives an update.

You can try this method for yourself:

```console
$ _venv/bin/sphinx-build -b html . _out
Running Sphinx v3.5.4
making output directory... done
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 5 source files that are out of date
updating environment: [new config] 5 added, 0 changed, 0 removed
reading sources... [100%] your-first-hunt
looking for now-outdated files... none found
pickling environment... done
checking consistency... done
preparing documents... done
writing output... [100%] your-first-hunt
generating indices... genindex done
writing additional pages... search done
copying images... [100%] _static/img/bunny-rabbit.png
copying static files... done
copying extra files... done
dumping search index in English (code: en)... done
dumping object inventory... done
build succeeded.

The HTML pages are in _out.
```

When the build is complete, open the `_out/index.html` file in a web browser to view the results.

> :bulb: **Run `_venv/bin/sphinx-build --help` for more options.**

#### Autobuild with live reloads

If you are working on the docs (e.g., writing or editing), you may find the [sphinx-autobuild](https://pypi.org/project/sphinx-autobuild/) program more useful than `sphinx-build` (see the previous section). When `sphinx-autobuild` detects a change in your RST files, it rebuilds the corresponding HTML and [reloads](https://www.npmjs.com/package/livereload) the browser so that you can see the changes immediately.

The `sphinx-autobuild` program is not listed in the [requirements](https://github.com/norosa/hunting-unicorns/tree/main/docs/requirements.txt) file because it is not necessary for automated builds. If you would like to use this tool, first install it into your virtual environment:

```console
$ _venv/bin/python3 -m pip install sphinx-autobuild
```

Then, for example, you could run:

```console
$ _venv/bin/sphinx-autobuild --open-browser --delay 1 -b html . _out
[...]
Running Sphinx v3.5.4
loading pickled environment... done
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 0 source files that are out of date
updating environment: 0 added, 0 changed, 0 removed
looking for now-outdated files... none found
no targets are out of date.
build succeeded.

The HTML pages are in _out.
[I 210514 17:36:39 server:335] Serving on http://127.0.0.1:8000
[I 210514 17:36:39 handlers:62] Start watching changes
[I 210514 17:36:39 handlers:64] Start detecting changes
[I 210514 17:36:41 handlers:135] Browser Connected: http://127.0.0.1:8000/
```

This command starts a lightweight webserver that serves the HTML documentation at http://127.0.0.1:8000/ and will continue to run (and print information to the console) until you terminate the program (e.g., with <kbd>CTRL</kbd>+<kbd>C</kbd>).

If you pass the `--open-browser` argument to the command (as above), it will open the HTML documentation in a new browser window after the webserver has started.

Once you have the top-level `index.html` open in a browser window, you can test your setup by editing the corresponding `index.rst` file and then save your changes. After a short delay, the browser window should reload, and your changes should be visible.

> :bulb: **Run `_venv/bin/sphinx-autobuild --help` for more options.**

### Build script

For convenience, there is a small script named [autobuild.sh](https://github.com/norosa/hunting-unicorns/tree/main/docs/autobuild.sh) that installs the [build requirements](#build-requirements) (if necessary) and starts an [autobuild with live reloads](#autobuild-with-live-reloads).

You can run the script like this:

```console
$ ./autobuild.sh
[...]
Running Sphinx v3.5.4
loading pickled environment... done
building [mo]: targets for 0 po files that are out of date
building [html]: targets for 0 source files that are out of date
updating environment: 0 added, 0 changed, 0 removed
looking for now-outdated files... none found
no targets are out of date.
build succeeded.

The HTML pages are in _out.
[I 210515 21:23:17 server:335] Serving on http://127.0.0.1:8000
[I 210515 21:23:17 handlers:62] Start watching changes
[I 210515 21:23:17 handlers:64] Start detecting changes
```

We designed this script for people who regularly work on the docs because it makes it easy to run the same build every time without remembering any command specifics.

> :bulb: **Please feel free to modify this script and share your improvements.**

### Troubleshooting the build

Sometimes, the build may stop updating the HTML as you expect. If this happens, terminate the build command and try again. If the problem persists, try resetting the build output and starting from scratch. You can reset the build output by removing the `_out` directory:

```console
$ rm -rf _out
```

If you experience any other issues, try resetting the Python virtual environment and then [recreate it again](#build-requirements) from scratch. You can reset the virtual environment by removing the `_venv` directory:

```console
$ rm -rf _venv
```

## Continuous integration

We use [Read The Docs](https://readthedocs.org/) (RTD) for [continuous integration](https://docs.readthedocs.io/en/stable/pull-requests.html) and [continuous deployment](https://docs.readthedocs.io/en/stable/webhooks.html). Visit the [hunting-unicorns](https://readthedocs.org/projects/hunting-unicorns/)  RTD project page (maintainer access only) for more information.

Every pull request must satisfy all configured checks before being merged:

- A [GitHub Actions](https://github.com/features/actions) workflow named [Linters](https://github.com/norosa/hunting-unicorns/blob/main/.github/workflows/linters.yml) has two steps:

  1. *Prose lint* — Uses the [official GitHub Vale action](https://github.com/errata-ai/vale-action) to lint all Markdown and RST files. We have configured [Vale](https://github.com/errata-ai/vale) to use [proselint](https://github.com/errata-ai/proselint) as an initial experiment. However, this setup has the possibility of being expanded into an automated style guide.

  2. *Vale* — Reports any lint messages produced for lines modified by the pull request. Each message carries an associated severity: *suggestion*, *warning*, and *error*. You must resolve errors and warnings. You may ignore suggestions.

- A [GitHub Actions](https://github.com/features/actions) workflow named [Link checks](https://github.com/norosa/hunting-unicorns/blob/main/.github/workflows/link-checks.yml) with one step:

  1. *Markdown links* — Checks Markdown documents for broken links.

- [Read The Docs](https://docs.readthedocs.io/en/stable/pull-requests.html) attempts to build the Sphinx docs on every pull request. If the build succeeds, you can select *Details* on this check to preview the documentation on the corresponding branch.

- [LGTM](https://lgtm.com/) analyzes Python code for common security issues. Select *Details* on this check for information about any detected issues.

## Contributing

Do you have experience hunting unicorns? Have you tried something in this guide that didn't work or could be improved? We welcome contributions of all types. An excellent way to get started is by opening a [new issue](https://github.com/norosa/hunting-unicorns/issues) creating a [pull request](https://github.com/norosa/hunting-unicorns/pulls). Thank you! :sparkles:

## License

Copyright 2021, the project contributors

This work is licensed under the [Apache License, Version 2.0](https://github.com/norosa/hunting-unicorns/blob/main/LICENSE.txt).
