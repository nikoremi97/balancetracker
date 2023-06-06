import os
import unittest
from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from models import Client

basedir = os.path.abspath(os.path.dirname(__file__))
app = Flask(__name__)
app.config.from_object('config.TestingConfig')
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)


class AppTestCase(unittest.TestCase):
    def setUp(self):
        app.testing = True
        self.app = app.test_client()
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()

    def test_index(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), 'This is the app index')

    def test_add_client(self):
        response = self.app.get('/add?name=John&money=100')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), 'Client added with id=1')

        # Verify the client is added to the database
        client = Client.query.get(1)
        self.assertIsNotNone(client)
        self.assertEqual(client.name, 'John')
        self.assertEqual(client.money, 100)

    def test_get_all(self):
        # Add a client to the database
        client = Client(name='John', money=100)
        db.session.add(client)
        db.session.commit()

        response = self.app.get('/getall')
        self.assertEqual(response.status_code, 200)

        # Verify the response data contains the added client
        expected_data = [
            {'id': client.id, 'name': client.name, 'money': client.money}]
        self.assertEqual(response.json, expected_data)

    def test_get_by_id(self):
        # Add a client to the database
        client = Client(name='John', money=100)
        db.session.add(client)
        db.session.commit()

        response = self.app.get(f'/get/{client.id}')
        self.assertEqual(response.status_code, 200)

        # Verify the response data matches the added client
        expected_data = {'id': client.id,
                         'name': client.name, 'money': client.money}
        self.assertEqual(response.json, expected_data)

    def test_get_by_name(self):
        # Add a client to the database
        client = Client(name='John', money=100)
        db.session.add(client)
        db.session.commit()

        response = self.app.get(f'/getn/{client.name}')
        self.assertEqual(response.status_code, 200)

        # Verify the response data matches the added client
        expected_data = {'id': client.id,
                         'name': client.name, 'money': client.money}
        self.assertEqual(response.json, expected_data)


if __name__ == '__main__':
    unittest.main()
