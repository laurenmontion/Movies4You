from flask import Blueprint, request, jsonify, make_response
import json
from src import db


user = Blueprint('userintro', __name__)

# User posts their preferences
@user.route('/userintro', methods=['POST'])
def add_user():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    firstname = request.form['firstname']
    lastname = request.form['lastname']
    age = request.form['age']
    address_country = request.form['address_country']
    address_state = request.form['address_state']
    email_address = request.form['email_address']
    query = f'INSERT INTO user(firstname, lastname, age, address_country, address_state, email_address) VALUES(\"{firstname}\", \"{lastname}\", \"{age}\", \"{address_country}\", \"{address_state}\", \"{email_address}\")
    db.get_db().commit()
    return "Success!"
    






@customers.route('/customers', methods=['GET'])
def get_customers():
    cursor = db.get_db().cursor()
    cursor.execute('select customerNumber, customerName,\
        creditLimit from customers')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get customer detail for customer with particular userID
@customers.route('/customers/<userID>', methods=['GET'])
def get_customer(userID):
    cursor = db.get_db().cursor()
    cursor.execute('select * from customers where customerNumber = {0}'.format(userID))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
