# ./Dockerfile

# Extend from the official Elixir image
FROM elixir:latest

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force
RUN mix local.rebar --force

# Repository creation
RUN mix ecto.create

RUN mix ecto.migrate

# Getting Libraries
RUN mix deps.get

# Compile the project
RUN mix do compile

EXPOSE 80:80

CMD ["/app/entrypoint.sh"]

RUN chmod +x /app/entrypoint.sh