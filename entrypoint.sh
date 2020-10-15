#!/bin/bash
# Docker entrypoint script.

exec MIX_ENV=prod mix phx.server


