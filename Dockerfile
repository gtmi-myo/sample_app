FROM ruby:3.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
RUN gem install bundler -v '2.3.14' && bundle install
ADD . /app

EXPOSE 3000

# Configure the main process to run when running the image
CMD [["rails", "server", "-b", "0.0.0.0"]