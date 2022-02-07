ARG base_image=ghcr.io/decidim/decidim:latest

FROM $base_image
LABEL maintainer="info@coditramuntana.com"
COPY ./src ./src
WORKDIR ./src
RUN gem install bundle
RUN bundle check || bundle install
RUN #bundle exec rake assets:precompile

#
ENV RAILS_ENV=development
ENV RAILS_SERVE_STATIC_FILES=true
#
EXPOSE 3000