#!/usr/bin/env bash

if [[ -z "$VIRTUAL_ENV" ]]; then
    .venv/bin/activate
fi

ruff format
ruff check --fix
