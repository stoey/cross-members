# Cross Members #
![Cross Members Logo](doc/cross-members.png)

A collection of scripts for common tasks to support building containers

Use in a Dockerfile with
```dockerfile
ADD https://github.com/stoey/cross-members/main.tar.gz /tmp/
RUN /tmp/cross-members-main/install

RUN cm <<command>> [args]
```

Alternatively pull a Cross Member infused distro image
```dockerfile
FROM stoey/cross-members:ubuntu-latest
```

Available commands are in `cross-members/share/cross-members/<distro>/`, call them by replacing the `/` in the paths with `-` so `user/new` becomes `cm user-new`

Currently the only distro supported is `ubuntu`.
## But why? ##

The aim is to not have to repeat the same invocations over many Dockerfiles while also adding to the readability of Dockerfiles.

## Commands ##

To see a list of commands run
```shell
cm cm-commands
```

See: [Commands](doc/commands.md)
