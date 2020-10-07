FROM elixir:latest
ARG app_name:ms_abac
ARG phoenix_subdir=.
ARG build_env=prod
ENV MIX_ENV=${build_env} TERM=xterm
WORKDIR /app
RUN apt-get update -y \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && apt-get install -y -q --no-install-recommends nodejs \
    && mix local.rebar --force \
    && mix local.hex --force
COPY . .
RUN mix do deps.get, compile
RUN mix distillery.release --env=${build_env} --executable --verbose \
    && mv _build/${build_env}/rel/ms_abac/bin/ms_abac.run start_release
