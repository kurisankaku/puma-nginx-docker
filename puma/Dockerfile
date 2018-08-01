FROM ruby:2.5.1
ENV RAILS_ENV development
RUN mkdir /api
COPY ./api /api/
WORKDIR /api
RUN mkdir -p /api/tmp/sockets \
  && mkdir -p /api/tmp/pids \
  && bundle install --path vendor/bundle
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
