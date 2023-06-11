import os
from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from secrets_manager import get_db_secret

basedir = os.path.abspath(os.path.dirname(__file__))

app = Flask(__name__)

app.config.from_object(os.environ['APP_SETTINGS'])
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['MYSQL_USER'] = 'admin' 

db_access = get_db_secret()
app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+pymysql://{db_access}@balancetracker-database.cx71efueaba7.us-east-1.rds.amazonaws.com:3306/clients'

db = SQLAlchemy(app)

from models import Client
# Index
@app.route("/")
def index():
    return "This is the app index V1"

# Add client and money
@app.route("/add")
def add_client():
    name = request.args.get('name')
    money = request.args.get('money')
    try:
        client = Client(
            name=name,
            money=money
        )
        db.session.add(client)
        db.session.commit()
        return "Client added with id={}".format(client.id)
    except Exception as e:
        return (str(e))

# Get all clients
@app.route("/getall")
def get_all():
    try:
        page = request.args.get('page', 1, type=int)
        per_page = request.args.get('per_page', 10, type=int)

        clients = Client.query.paginate(page, per_page, error_out=False)

        if not clients.items:
            return jsonify({'message': 'No clients found'}), 404

        client_list = []
        for client in clients.items:
            client_list.append({
                'id': client.id,
                'name': client.name,
                'money': client.money
                # Add more attributes as needed
            })

        result = {
            'clients': client_list,
            'page': clients.page,
            'per_page': clients.per_page,
            'total_pages': clients.pages,
            'total_clients': clients.total
        }

        return jsonify(result)
        # clients = Client.query.all()
        # return jsonify([e.serialize() for e in clients])
    except Exception as e:
        return (str(e))

# Get client by ID
@app.route("/get/<id_>")
def get_by_id(id_):
    try:
        # this should be paginated
        client = Client.query.filter_by(id=id_).first()
        return jsonify(client.serialize())
    except Exception as e:
        return (str(e))

# Get client by Name
@app.route("/getn/<name_>")
def get_by_name(name_):
    try:
        client = Client.query.filter_by(name=name_).first()
        return jsonify(client.serialize())
    except Exception as e:
        return (str(e))


if __name__ == '__main__':
    app.run()
