if (!(Test-Path .venv)) {
    python -m venv .venv
}

.venv\Scripts\activate
python -m pip install --upgrade pip setuptools wheel
pip install ruff
pip install -r requirements.txt

if (!(Test-Path .env)) {
    Copy-Item example.env .env
}

if (Test-Path db.sqlite3) {
    Remove-Item db.sqlite3
}

python manage.py makemigrations
python manage.py migrate
python manage.py createsuperuser --noinput --username user --email user@email.com
