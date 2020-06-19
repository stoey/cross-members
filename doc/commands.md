# Commands #

These are the commands currently supported by `cm`
## cm ##
### cm-commands ###
List available cm commands
```
cm cm-commands [list|usage|paths|markdown]
```
## cm ##
### cm-test ###
Test cm is installed
```
cm cm-test
```
## package ##
### package-install ###
Install packages from lists
```
cm package-install packagelist ...
```
## user ##
### user-new ###
Create a new user
```
cm user-new user
```
## user ##
### user-sudoer ###
Add a user to sudoers
```
cm user-sudoer user
```
## volume ##
### volume-new ###
Create a directory for use as a volume
```
cm volume-new [[user]:[group]] path ...
```
---
<sub>Automatically generated at: Fri Jun 19 00:14:02 UTC 2020 (commit: bd47a8fd6a58c766ca1c4f58767505364454288e)
