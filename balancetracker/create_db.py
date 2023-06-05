from app import app, db
from models import Client

with app.app_context():
    db.create_all()
