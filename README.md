= Cross Members =

A collection of scripts for common tasks when building containers

Use in a Dockerfile with
```
ADD https://github.com/stoey/cross-members/master.tar.gz /tmp/
RUN /tmp/cross-members-master/install
RUN cm <<command>> [args]
```

Alternatively pull a Cross Member infused distro image
```
FROM stoey/cross-members:ubuntu-latest
```

Available commands are in `cross-members/share/dkbtk/<distro>/`, call them by replacing the `/` in the paths with `-` so `user/new` becomes `cm user-new`

Curretnly the only distro supported is `ubuntu`.

== But why? ==

The aim is to not have to repeat the same invocations over many Dockerfiles while also adding to the readability of Dockerfiles.

== Commands ==

* `cm-test` - Self-test command to confirm cross-members can run correctly
* `package-install [package list files...]` - Install a list of packages from a file.  This allows your dependencies to be grouped into separate files with comments (`#`).  It also handles minimizing the build size by updating and removing packaging caches when it's done.
* `user-new [username]` - Add a new user to the container
* `user-sudoer [username]` - Make a user a sudoer
