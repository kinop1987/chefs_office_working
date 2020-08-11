FROM ruby:2.7
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq \
    && apt-get install -y nodejs yarn \
    && mkdir /chefs_office_working
WORKDIR /chefs_office_working
COPY Gemfile /chefs_office_working/Gemfile
COPY Gemfile.lock /chefs_office_working/Gemfile.lock
RUN bundle install
COPY . /chefs_office_working

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]