from flask import Blueprint, request, jsonify, make_response, current_app
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
    cursor = db.get_db().cursor()
    query = f'INSERT INTO user(firstname, lastname, age, address_country, address_state, email_address) VALUES(\"{firstname}\", \"{lastname}\", \"{age}\", \"{address_country}\", \"{address_state}\", \"{email_address}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

@user.route('/userpreferences', methods=['POST'])
def post_preferences():
    primary_lang = request.form['primary_lang']
    length_limit = request.form['length_limit']
    max_maturity_rating = request.form['max_maturity_rating']
    min_critic_rating = request.form['min_critic_rating']
    fav_director_id = request.form['fav_director_id']
    fav_actor_id = request.form['fav_actor_id']
    fav_genre_id = request.form['fav_genre_id']
    cursor = db.get_db().cursor()
    query = f'INSERT INTO user(primary_lang, length_limit, max_maturity_rating, min_critic_rating, fav_director_id, fav_actor_id, fav_genre_id) VALUES (\"{primary_lang}\", \"{length_limit}\", \"{max_maturity_rating}\",\"{min_critic_rating}\",\"{fav_director_id}\",\"{fav_actor_id}\",\"{fav_genre_id}\")'
    cursor.execute(query)
    db.get_db().commit()
    return "Success!"

#User recieves reccomended movies
@user.route('/lanuagerecc', methods=['GET'])
def get_movies():
    cursor = db.get_db().cursor()
    cursor.execute('SELECT * FROM movie_data JOIN preferences_data WHERE movie_data.lanuguage = preferences_data.primary_lang ')
    row_headers = [x[0] for x in cursor.description]
    json_data = []
    theData = cursor.fetchall()
    for row in theData:
        json_data.append(dict(zip(row_headers, row)))
    the_response = make_response(jsonify(json_data))
    the_response.status_code = 200
    the_response.mimetype = 'application/json'
    return the_response
