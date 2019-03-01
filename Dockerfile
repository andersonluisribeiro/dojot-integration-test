FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client g++ qt5-default libqt5webkit5-dev gstreamer1.0-plugins-base gstreamer1.0-tools gstreamer1.0-x
RUN mkdir /dojot-integration-test
WORKDIR /dojot-integration-test
COPY Gemfile /dojot-integration-test/Gemfile
COPY Gemfile.lock /dojot-integration-test/Gemfile.lock
RUN bundle install
COPY . /dojot-integration-test

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
