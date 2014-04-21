# -*- sh -*-
FROM ubuntu:precise

MAINTAINER Dan Leehr dan.leehr@nescent.org

# Update sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# ubuntu packages
RUN apt-get install -qy git vim curl file
RUN apt-get install -qy build-essential libpq-dev libv8-dev libsqlite3-dev
RUN apt-get install -qy --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# Install ruby
add scripts/install-ruby /install-ruby
RUN /install-ruby

# Install bundler
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

# copy the upgrade-admin script
ADD scripts/upgrade-admin /upgrade-admin

EXPOSE 3000
USER rails
CMD /start