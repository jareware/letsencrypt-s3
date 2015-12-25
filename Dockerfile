# https://hub.docker.com/_/ubuntu/
FROM ubuntu:16.04

# https://github.com/jareware/letsencrypt-s3-autopilot
MAINTAINER Jarno Rantanen <jarno@jrw.fi>

# http://letsencrypt.readthedocs.org/
# https://aws.amazon.com/cli/
RUN apt-get update
RUN apt-get install -y letsencrypt awscli
