FROM starefossen/ruby-node:2-8-slim
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev
RUN mkdir /auth0app
WORKDIR /auth0app
COPY Gemfile Gemfile.lock /auth0app/
RUN bundle install
ADD . /auth0app
