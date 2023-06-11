import unittest
import json
from app import app

class AppTestCase(unittest.TestCase):

    def setUp(self):
        app.testing = True
        self.app = app.test_client()

    def test_index(self):
        response = self.app.get('/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), 'This is the app index V1')

    def test_add_client(self):
        response = self.app.get('/add?name=John&money=1000')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data.decode(), 'Client added with id=1')

    def test_get_all_clients(self):
        response = self.app.get('/getall')
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.data.decode())
        self.assertIsInstance(data['clients'], list)

    def test_get_client_by_id(self):
        response = self.app.get('/get/1')
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.data.decode())
        self.assertEqual(data['id'], 1)

    def test_get_client_by_name(self):
        response = self.app.get('/getn/John')
        self.assertEqual(response.status_code, 200)
        data = json.loads(response.data.decode())
        self.assertEqual(data['name'], 'John')

if __name__ == '__main__':
    unittest.main()
