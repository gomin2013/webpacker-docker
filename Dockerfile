# Define version variables.
ARG RUBY_VERSION=2.6.5-alpine3.10

# Load the Docker image.
FROM ruby:${RUBY_VERSION}

# Define environment variables.
ENV LANG C.UTF-8
ENV PS1 '▶ '
ARG RAILS_ROOT=/app

# Set up a work directory.
RUN mkdir $RAILS_ROOT
WORKDIR $RAILS_ROOT

# Install Packages.
RUN apk update && \
    apk upgrade && \
    apk add --update --no-cache --virtual=.build-dependencies \
      build-base \
      curl-dev \
      linux-headers \
      libxml2-dev \
      libxslt-dev \
      npm \
      postgresql-dev \
      ruby-dev \
      yaml-dev \
      graphviz \
      zlib-dev && \
    apk add --update --no-cache \
      bash \
      git \
      openssh \
      postgresql \
      ruby-json \
      tzdata \
      vim \
      nodejs \
      yaml && \
    npm i -g yarn

# Install Rails.
RUN gem install rails -v 5.2.3 && \
    apk del .build-dependencies
