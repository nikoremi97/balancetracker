import uuid
from sqlalchemy.dialects.mysql import CHAR
from app import db

class Client(db.Model):
    __tablename__ = 'clients'

    #Fields
    id = db.Column(CHAR(20), default=lambda: str(uuid.uuid4()), primary_key=True)
    name = db.Column(db.String(30))
    money = db.Column(db.Integer)

    #Initialize database
    def __init__(self, name, money):
        self.name = name
        self.money = money

    def __repr__(self):
        return '<id {}>'.format(self.id)

    #For JSON serialization purposes
    def serialize(self):
        return {
            'id': self.id,
            'name': self.name,
            'money': self.money
        }
