FROM ruby:2.1.3

RUN apt-get update && apt-get install -y

WORKDIR /tmp
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock
RUN bundle install

ADD . /app
WORKDIR /app

ENTRYPOINT ["bundle", "exec", "ruby", "app.rb"]
