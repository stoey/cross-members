ARG distro=ubuntu
ARG tag=latest
FROM ${distro}:${tag}

ADD dist/cross-members.tar.gz /tmp/cross-members-main/
# We do this with a tarball to mimic:
# ADD https://github.com/stoey/cross-members/archive/main.tar.gz /tmp/
RUN /tmp/cross-members-main/install

