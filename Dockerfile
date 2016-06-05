FROM ruby:2.3

WORKDIR /usr/src/app
RUN ( curl -sL https://deb.nodesource.com/setup_0.12 | bash ) && \
    apt-get install -y libpq-dev libsqlite3-dev sqlite3 nodejs

COPY ./potmum/Gemfile .
COPY ./potmum/Gemfile.lock .
RUN bundle install --path vendor/bundle

COPY ./potmum/ ./
COPY ./database.yml ./config/database.yml
RUN ln -s /data/attachment_files ./public/attachment_files
RUN RAILS_ENV="production" \
    bundle exec rake assets:precompile assets:environment
COPY ./start.sh .

ENV RAILS_ENV="production"
EXPOSE 9292
CMD [ "bash", "./start.sh" ]
