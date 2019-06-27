ARG version=latest
FROM ubuntu:$version
#MAINTAINER JCD "jcd717@outlook.com" this directive is deprecated and rplaced by LABEL
# the number of the layers is limited, and it is more performant if we reduce the nuùmber of the layers
RUN \
    apt update; \
    apt clean; \
    apt install -y curl;\
    rm -rf /var/lib/apt/lists/*
LABEL maintainer="JCD <jcd717@outlook.com>" \
      description="test" \
      auteur="bruno dubois"

# COPY command brings the zipped and tar files as they are and then we should excute a command to unzip them
# ADD will do this automatically
#REMARK: the most stable directives to be added at the beginning of the docker file script
COPY heartbeat.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh ; \
    echo coucou >test.txt

ARG hbs=3
ENV HEARTBEATSTEP $hbs


# information util sur les de port qui couvre le containeur: it is informative and not obligatory
EXPOSE 1234/udp 4321/tcp

# ENTRYPOINT: The command exeucted for the RUN of the container
#IF no Entry point is defined the the default will be used : /bin/sh -c
ENTRYPOINT ["/entrypoint.sh"]

#CMD The arguments of the ENTRYPOINT
CMD ["battement"]