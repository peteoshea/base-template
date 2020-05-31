# Base Template

A generic template repository for any type of project.
This includes both PowerShell and bash scripts to manage your development environment.
For more details of these scripts check out the following projects:
- [powershell-scripts-to-rule-them-all](https://github.com/peteoshea/powershell-scripts-to-rule-them-all)
- [scripts-to-rule-them-all](https://github.com/peteoshea/powershell-scripts-to-rule-them-all)

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
