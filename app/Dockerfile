# -*- sh -*-
FROM ubuntu:precise

MAINTAINER Dan Leehr dan.leehr@nescent.org

# Update sources
RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update

# ubuntu packages
RUN apt-get install -qy git vim curl
RUN apt-get install -qy build-essential libpq-dev libv8-dev libsqlite3-dev
RUN apt-get install -qy --force-yes zlib1g-dev libssl-dev libreadline-dev libyaml-dev libxml2-dev libxslt-dev

# Install rbenv and ruby-build
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN ./root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh # or /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

# Install ruby
ENV CONFIGURE_OPTS --disable-install-doc
RUN rbenv install 2.0.0-p451

# Set global rbenv
RUN rbenv global 2.0.0-p451

RUN apt-get clean

# bundler

RUN rbenv rehash
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