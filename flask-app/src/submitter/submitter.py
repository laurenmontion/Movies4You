from flask import Blueprint, request, jsonify, make_response
import json
from src import db


submitters = Blueprint('submitter', __name__)


# get all movies from the DB with a certain movie-id
@submitters.route('/submitter/movie-id', methods = ['GET]'])
def get_movies(movie_id):
    cursor = db.get_db().cursor()
    cursor.execute('select * from movie_data where movie_id = {0}'.format(movie_id))
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response


@submitters.route('/submitter', methods=['POST]'])
def add_movies():
    current_app.logger.info(request.form)
    cursor = db.get_db().cursor()
    movie_id = request.form['movie_id']
    title = request.form['title']
    language = request.form['language']
    runtime = request.form['runtime']
    time_period = request.form['time_period']
    critic_rating = request.form['critic_rating']
    maturity_rating = request.form['maturity_rating']
    producer_name = request.form['producer_name']
    release_date = request.form['release_date']
    directed_by = request.form['directed_by']
    genre_id = request.form['genre_id']

    query = f'INSERT INFO movie_data()'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

# Get all customers from the DB
@customers.route('/submitter', methods=['GET'])
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