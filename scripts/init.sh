#!/usr/bin/env bash

set -e

if [ ! -d ".venv" ]; then
    python -m venv .venv
fi

source .venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
pip install -r requirements-dev.txt

if [ ! -f ".env" ]; then
    cp example.env .env
fi

if [ -f "db.sqlite3" ]; then
    rm db.sqlite3
fi

python ./app/manage.py makemigrations
python ./app/manage.py migrate
python ./app/manage.py createsuperuser --noinput --username user --email user@email.com
