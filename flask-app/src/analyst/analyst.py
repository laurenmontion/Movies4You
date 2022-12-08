from flask import Blueprint, request, jsonify, make_response
import json
from src import db


analyst = Blueprint('analyst', __name__)

# Get all movie submitters from the DB
@analyst.route('/moviesubmitters', methods=['GET'])
def get_submitters():
    cursor = db.get_db().cursor()
    cursor.execute('select * from submitter_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
    
# Get information about a specific movie submitter 
@analyst.route('/moviesubmitters/<employee_id>', methods=['GET'])
def get_customer(employee_id):
    cursor = db.get_db().cursor()
    cursor.execute('select employee_id from submitter_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response

# Get all movie submitters from the DB
@analyst.route('/moviedata', methods=['GET'])
def get_movies():
    cursor = db.get_db().cursor()
    cursor.execute('select movie_id, title from movie_data')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
                   





