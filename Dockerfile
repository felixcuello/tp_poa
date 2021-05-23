FROM ruby:2.7.3 as base
MAINTAINER Felix Cuello

ARG RAILS_ENV=development
ENV RAILS_ENV=$RAILS_ENV

# All other environment variables should be injected with the `--env-file` flag
ENV RAILS_ENV development

WORKDIR /app

#  Install Gems and Ruby dependencies
# -------------------------------------------------------------------------
COPY . /app
RUN gem install bundler
RUN bundle install

ENTRYPOINT ./start_rails.sh
