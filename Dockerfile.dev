FROM ruby:3.0.2-alpine

#setup deps for rails 
RUN apk add --update --virtual \
runtime-deps \
postgresql-client \
build-base \
libxml2-dev \
libxslt-dev \
nodejs-current \
yarn \
npm \
libffi-dev \
readline \
postgresql-dev \
libc-dev \
linux-headers \
readline-dev \
file \
imagemagick \
git \
tzdata \
&& rm -rf /var/cache/apk*

WORKDIR /usr/src/app
COPY Gemfile* ./

RUN yarn install
RUN bundle install
COPY . .

EXPOSE 3000
CMD rails server -b 0.0.0.0

