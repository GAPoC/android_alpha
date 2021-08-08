FROM ruby:2.6.5

RUN mkdir -p /app
WORKDIR /app

ADD Gemfile /app/Gemfile
RUN  gem install bundler -v 1.17.3
RUN bundle install --system

ADD . /app

EXPOSE 80

CMD ["bash"]