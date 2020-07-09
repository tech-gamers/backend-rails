FROM ruby:2.6.6

WORKDIR /app

COPY Gemfile* .
RUN bundle

RUN apt-get update -qq
RUN apt-get install -y nodejs

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]
