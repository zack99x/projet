FROM elixir:latest

WORKDIR /app

COPY mix.exs .
COPY mix.lock .

RUN apt-get update && \
    # apt-get install erlang && \
    apt-get install -y postgresql-client && \
    apt-get install -y inotify-tools && \
    apt-get install -y nodejs npm && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.5.3 --force && \
    mix local.rebar --force

RUN mix deps.get && mix local.hex --force



#  COPY assets/css
# COPY assets/package-lock.json assets

CMD cd ptm_api && mix deps.get && mix local.hex --force && cd assets && npm install && cd .. && mix ecto.setup && mix phx.server
