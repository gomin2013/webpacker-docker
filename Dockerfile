# rails5_product
FROM ruby:2.6.2
ENV LANG C.UTF-8
ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

# Download NodeJS & Yarn installers.
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash \
&& curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
&& echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Install Packages.
RUN apt-get update -qq \
&& apt-get install -y nodejs yarn --no-install-recommends \
&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV APP_HOME /app

RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install rails -v 5.2.3