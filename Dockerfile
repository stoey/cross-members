ARG distro=ubuntu
ARG tag=latest
FROM ${distro}:${tag}

ADD dist/cross-members.tar.gz /tmp/cross-members-master/
# We do this with a tarball to mimic:
# ADD https://github.com/stoey/cross-members/archive/master.tar.gz /tmp/
RUN /tmp/cross-members-master/install

