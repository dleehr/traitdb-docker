# -*- sh -*-
FROM ubuntu:precise

MAINTAINER Dan Leehr dan.leehr@nescent.org

# Update sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# development tools
RUN apt-get -qy install git vim

# ruby 1.9.3 and build dependencies
# There's no ubuntu package for 2.0
RUN apt-get -qy install ruby1.9.1 ruby1.9.1-dev build-essential libpq-dev libv8-dev libsqlite3-dev

# bundler
RUN gem install bundler

# create a "rails" user
# the Rails application will live in the /rails directory
RUN adduser --disabled-password --home=/rails --gecos "" rails

# copy the Rails app
ADD TraitDB /rails

# Set the owner
RUN chown -R rails /rails

# copy and execute the setup script
# this will run bundler, setup the database, etc.
ADD scripts/setup /setup
RUN su rails -c /setup

# copy the start script
ADD scripts/start /start

EXPOSE 3000
USER rails
CMD /start