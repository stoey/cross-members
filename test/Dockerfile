ARG distro=ubuntu
ARG tag=latest
FROM stoey/cross-members:${distro}-${tag}

COPY tests /tmp/cross-members-tests
COPY run-all run-test /tmp/

CMD /tmp/run-all
