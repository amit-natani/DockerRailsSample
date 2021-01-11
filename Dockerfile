FROM ruby:2.7
RUN apt-get update -qq && apt-get install -y  nodejs postgresql-client
WORKDIR /mydockerapp
COPY Gemfile /mydockerapp/Gemfile
COPY Gemfile.lock /mydockerapp/Gemfile.lock
RUN bundle install
COPY . /mydockerapp


COPY entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

# Start the process
CMD ["rails", "server", "-b", "0.0.0.0"]