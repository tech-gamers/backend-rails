FROM ruby:2.6.6

WORKDIR /app

RUN apt-get update -qq && \
  apt-get install -y --no-install-recommends \
  curl nodejs postgresql-client \
  apt-transport-https

# Intall latest yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

COPY package.json .
COPY yarn.lock .
RUN yarn install --check-files

COPY Gemfile* ./
RUN bundle install --without test development

COPY . .

# FIXME: it requires development dependcies
#   there must be a way to do it properly
# RUN bundle exec rake assets:precompile

CMD ["rails", "server", "-b", "0.0.0.0"]
