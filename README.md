# Base Template

[![CI](https://github.com/peteoshea/base-template/workflows/CI/badge.svg)](https://github.com/peteoshea/base-template/actions)

A generic template repository for any type of project.
This includes both PowerShell and bash scripts to manage your development environment.
For more details of these scripts check out the following projects:
- [powershell-scripts-to-rule-them-all](https://github.com/peteoshea/powershell-scripts-to-rule-them-all)
- [scripts-to-rule-them-all](https://github.com/peteoshea/scripts-to-rule-them-all)

## The Scripts

The following is a list of scripts and their primary responsibilities.

### [script/setup][setup]

Used to set up a project in an initial state.
This is typically run after an initial clone, or, to reset the project back to its initial state.

### [script/update][update]

Used to update the project after a fresh pull.
This should include any database migrations or any other things required to get the state of the
app into shape for the current version that is checked out.

### [script/update][update]

Used to update the project after a fresh pull.
This should include any database migrations or any other things required to get the state of the
app into shape for the current version that is checked out.

### [script/test][test]

Used to run the test suite of the project.
To allow this script to be run from CI setup should be done outside of this script.
A manual call to [update][update] before running the tests is usually a good idea.

A good pattern to support is having optional arguments that allow you to run specific tests.

Linting is also be considered a form of testing.
These tend to run faster than tests, so put them towards the beginning so it fails faster if
there's a linting problem.

## Installing Dependencies

The [bootstrap][bootstrap] script, called from both [setup][setup] and [update][update] scripts,
is used solely for fulfilling dependencies of the project.
This can mean installing packages, updating git submodules, etc.
The goal is to make sure all required dependencies are installed.

This script currently allows for following package managers:

### [Chocolatey](https://chocolatey.org/)

If you have some [Chocolatey](https://chocolatey.org/) packages required then you can simply add a
`chocolatey-packages` file at the top level of the project with a list of the packages and they
will be installed and updated as required.

### [winget](https://github.com/microsoft/winget-cli)

Microsoft has recently released it's own package manager
[winget](https://github.com/microsoft/winget-cli).
This is currently only a preview so some functionality may not be available yet but it sounds
promising so if you want to use this to install some packages then you can simply add a
`winget-packages` file at the top level of the project with a list of the packages and they will be
installed and updated as required.

##  Windows Development

The following scripts will help you maintain your local development system.
If you have any [Chocolatey](https://chocolatey.org/) or [winget](https://github.com/microsoft/winget-cli) packages required then you can simply add a `chocolatey-packages` or `winget-packages` file at the top level of the project with a list of the packages and they will be installed and updated as required.

### [powershell/setup](powershell/setup.ps1)

Used to set up a project in an initial state.
This is typically run after an initial clone, or, to reset the project back to its initial state.

### [powershell/update](powershell/update.ps1)

Used to update the project after a fresh pull.
This should include any database migrations or any other things required to get the
state of the app into shape for the current version that is checked out.

##  Linux Development

The following scripts are for use on a Linux based system, including MacOS or even Windows Subsystem for Linux.
If you have any dependencies then you can add them to the appropriate file(s):
- `Brewfile`
- `apt-pkgs`
- `yum-pkgs`

### [script/setup](script/setup)

Used to set up a project in an initial state.
This is typically run after an initial clone, or, to reset the project back to
its initial state.

### [script/update](script/update)

Used to update the project after a fresh pull.
This should include any database migrations or any other things required to get the
state of the app into shape for the current version that is checked out.
