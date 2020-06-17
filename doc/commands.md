# Commands #

These are the commands currently supported by `cm`
## cm-commands ##
List available cm commands
```shell
cm cm-commands [list|usage|paths]
```

## cm-test ##
Test cm is installed
```shell
cm cm-test
```

## package-install ##
Install packages from lists
```shell
cm package-install packagelist ...
```

## user-new ##
Create a new user
```shell
cm user-new user
```

## user-sudoer ##
Add a user to sudoers
```shell
cm user-sudoer user
```

## volume-new ##
Create a directory for use as a volume
```shell
cm volume-new [[user]:[group]] path ...
```

---
<sub>Automatically generated at: Wed Jun 17 17:59:44 UTC 2020 (commit: 5576789f36383c76d19f1e5844dc27f133383e7e)
