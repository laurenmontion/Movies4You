# create database
CREATE DATABASE movies_4_you_db;

# create first user and grant privileges
CREATE USER 'user'@'%' IDENTIFIED BY 'ilovemovies123';
GRANT ALL PRIVILEGES ON movies_4_you_db.* TO 'user'@'%';
FLUSH PRIVILEGES;

# second user with privileges
CREATE USER 'moviesubmitter'@'%' IDENTIFIED BY 'c0c0nuT65';
GRANT ALL PRIVILEGES ON movies_4_you_db.* TO 'moviesubmitter'@'%';
FLUSH PRIVILEGES;

# third user with privileges
CREATE USER 'analyst'@'%' IDENTIFIED BY '**cL0cK$';
GRANT ALL PRIVILEGES ON movies_4_you_db.* TO 'analyst'@'%';
FLUSH PRIVILEGES;

# working inside database
USE movies_4_you_db;

# analyst table
CREATE TABLE analyst_data (
	company_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	years_working INTEGER,
	salary VARCHAR(50)
);

INSERT INTO analyst_data VALUES (37013, 'Rafe', 'McAlister', 6, '$73659.82');
INSERT INTO analyst_data VALUES (23286, 'Irita', 'Brantzen', 4, '$71677.39');
INSERT INTO analyst_data VALUES (33307, 'Dayle', 'Reeken', 16, '$79994.43');
INSERT INTO analyst_data VALUES (87839, 'Meg', 'Roadnight', 21, '$97497.73');
INSERT INTO analyst_data VALUES (15813, 'Tisha', 'Morrallee', 17, '$97038.89');


# user table
create table user_data (
	user_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	age INTEGER,
	address_state VARCHAR(50),
	address_country VARCHAR(50),
	email_address VARCHAR(50),
);

INSERT INTO user_data VALUES (85739, 'Ursuline', 'Torre', 29, '7 Coleman Lane', 'San Antonio', 'Texas', '78220', 'United States', 37013, 'utorre0@virginia.edu');
INSERT INTO user_data VALUES (11029, 'Ichabod', 'Ouver', 60, '25194 Sage Crossing', 'Grand Forks', 'North Dakota', '58207', 'United States', 37013, 'iouver1@forbes.com');
INSERT INTO user_data VALUES (00087, 'Marley', 'Ivachyov', 23, '2 Buena Vista Street', 'Atlanta', 'Georgia', '30316', 'United States', 23286, 'mivachyov2@sourceforge.net');
INSERT INTO user_data VALUES (74803, 'Clemence', 'Rahl', 46, '2 Mitchell Junction', 'Chicago', 'Illinois', '60681', 'United States', 87839, 'crahl3@oracle.com');
INSERT INTO user_data VALUES (33845, 'Alyson', 'Vines', 18, '22 Delladonna Parkway', 'Sacramento', 'California', '95813', 'United States', 15813, 'avines4@google.fr');

# preferences table
create table preferences_data (
	set_id INTEGER PRIMARY KEY,
	user_id INTEGER,
	primary_lang VARCHAR(50),
	length_limit INTEGER,
	max_maturity_rating VARCHAR(50),
	min_critic_rating VARCHAR(50),
	fav_director_id INTEGER,
	fav_actor_id INTEGER,
	fav_genre_id INTEGER,
    CONSTRAINT preferences_fk_1 FOREIGN KEY (user_id) REFERENCES user_data (user_id),
    CONSTRAINT preferences_fk_2 FOREIGN KEY (fav_actor_id) REFERENCES actor_data (actor_id)
);

INSERT INTO preferences_data (set_id, user_id, primary_lang, length_limit, max_maturity_rating, min_critic_rating, fav_director_id, fav_actor_id, fav_genre_id)
VALUES (20014, 34030, 'Dhivehi', 71, '9418 Old Shore Drive', 'Marseille', 06348, 43537, 66730);

INSERT INTO preferences_data (set_id, user_id, primary_lang, length_limit, max_maturity_rating, min_critic_rating, fav_director_id, fav_actor_id, fav_genre_id)
VALUES (46255, 83170, 'Portuguese', 95, '8639 Utah Pass', 'Sanxi', 37644, 53633, 90920);

INSERT INTO preferences_data (set_id, user_id, primary_lang, length_limit, max_maturity_rating, min_critic_rating, fav_director_id, fav_actor_id, fav_genre_id)
VALUES (28796, 06361, 'Tetum', 128, '00 Morning Alley', 'Bulo', 14300, 23552, 15265);

INSERT INTO preferences_data (set_id, user_id, primary_lang, length_limit, max_maturity_rating, min_critic_rating, fav_director_id, fav_actor_id, fav_genre_id)
VALUES (46174, 46691, 'Mongolian', 128, '72913 Arrowood Hill', 'Kerrobert', 31776, 75986, 92111);

INSERT INTO preferences_data (set_id, user_id, primary_lang, length_limit, max_maturity_rating, min_critic_rating, fav_director_id, fav_actor_id, fav_genre_id)
VALUES (37559, 07179, 'Georgian', 154, '6183 Westport Trail', 'Río Tercero', 99322, 51321, 01734);

# preference trigger table
create table preference_trigger_data (
	set_id INTEGER,
	warning_name VARCHAR(50) PRIMARY KEY,
	intensity_tolerance VARCHAR(50),
    CONSTRAINT preference_trigger_fk_1 FOREIGN KEY (set_id) REFERENCES preferences_data (set_id)
);

INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (46174, '79823', 'Cthrine');
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (37559, '17776', 'Junette');
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (20014, '51723', 'Ethelyn');
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (37559, '09697', 'Nisse');
INSERT INTO preference_trigger_data (set_id, warning_name, intensity_tolerance) VALUES (28796, '76561', 'Brooke');

# email table
CREATE TABLE email_data (
	email_address VARCHAR(50) PRIMARY KEY,
	person_id INTEGER,
	description VARCHAR(50),
    CONSTRAINT email_fk_1 FOREIGN KEY (person_id) REFERENCES analyst_data (company_id),
    CONSTRAINT email_fk_2 FOREIGN KEY (person_id) REFERENCES submitter_data (employee_id)
);

INSERT INTO email_data VALUES ('fgillis0@tuttocitta.it', 24249, 'Business');
INSERT INTO email_data VALUES ('jivoshin1@jiathis.com', 35913, 'Business');
INSERT INTO email_data VALUES ('dorpin2@phpbb.com', 78752, 'Business');
INSERT INTO email_data VALUES ('kbrockie3@cornell.edu', 54217, 'Business');
INSERT INTO email_data VALUES ('tbasset4@opera.com', 78330, 'Business');
INSERT INTO email_data VALUES ('dcarus5@house.gov', 37013, 'Business');
INSERT INTO email_data VALUES ('alambshine6@ebay.com', 23286, 'Business');
INSERT INTO email_data VALUES ('dbroadway7@businessinsider.com', 33307, 'Business');
INSERT INTO email_data VALUES ('bkelleway8@cloudflare.com', 87839, 'Business');
INSERT INTO email_data VALUES ('wguisby9@hhs.gov', 15813, 'Business');
INSERT INTO email_data VALUES ('jmathiasa@sciencedaily.com', 15813, 'Personal');
INSERT INTO email_data VALUES ('dbaineb@tripadvisor.com', 33307, 'Personal');
INSERT INTO email_data VALUES ('khasselbyc@unicef.org', 78752, 'Personal');
INSERT INTO email_data VALUES ('gmcinteed@paypal.com', 78330, 'Personal');

# movie table
CREATE TABLE movie_data (
	movie_id INTEGER PRIMARY KEY,
	title VARCHAR(50),
	language VARCHAR(50),
	runtime INTEGER,
	time_period VARCHAR(20),
	critic_rating INTEGER,
	maturity_rating VARCHAR(20),
	producer_name VARCHAR(50),
	release_date DATE,
	submitted_by INTEGER,
	directed_by INTEGER,
	genre_id INTEGER,
    CONSTRAINT movie_fk_1 FOREIGN KEY (submitted_by) REFERENCES submitter_data (employee_id),
    CONSTRAINT movie_fk_2 FOREIGN KEY (directed_by) REFERENCES director_data (director_id),
    CONSTRAINT movie_fk_3 FOREIGN KEY (genre_id) REFERENCES genre_data (genre_id)
);

INSERT INTO movie_data VALUES (21348, 'Lady, The', 'Zulu', 191, '1930s', 9, 'PG-13', 'Rutter Canny', 'X', 24249, 91399, 74570);
INSERT INTO movie_data VALUES (73215, 'King Kong', 'New Zealand Sign Language', 152, '1890s', 9, 'PG', 'Cassey Grzesiewicz', '04-04-1990', 24249, 91399, 74570);
INSERT INTO movie_data VALUES (63960, 'Cops and Robbersons', 'Arabic', 190, '2000s', 2, 'PG-13', 'Bartlett Halfhead', '18-04-1987', 24249, 85682, 74570);
INSERT INTO movie_data VALUES (44174, 'Blood: The Last Vampire', 'Finnish', 183, '1990s', 10, 'PG', 'Franzen Goldney', '04-12-2015', 24249, 75677, 74570);
INSERT INTO movie_data VALUES (62679, '8 Seconds', 'Estonian', 110, '1990s', 9, 'PG', 'Clara Thirkettle', '11-12-2007', 24249, 33006, 73666);
INSERT INTO movie_data VALUES (35474, 'Slave of Love, A (Raba lyubvi)', 'Croatian', 136, '1700s', 7, 'R', 'Dodi Janicijevic', '23-04-2006', 35913, 65725, 85307);
INSERT INTO movie_data VALUES (78959, 'Little Soldier (Lille soldat)', 'Korean', 152, '1940s', 4, 'PG-13', 'Carmina Brevetor', '19-05-1980', 35913, 91399, 73666);
INSERT INTO movie_data VALUES (36296, 'Pekka ja Pätkä lumimiehen jäljillä', 'Dhivehi', 101, '1920s', 8, 'X', 'Devinne Quadri', '20-01-2010', 35913, 38272, 85307);
INSERT INTO movie_data VALUES (57104, 'So Long Letty', 'Malayalam', 198, '2010s', 8, '2R', 'Regan Bamford', '06-04-2000', 35913, 50612, 87626);
INSERT INTO movie_data VALUES (39933, 'Happiness', 'Georgian', 168, '1860s', 9, 'G', 'Anastassia Baudy', '03-09-1984', 35913, 86404, 73666);
INSERT INTO movie_data VALUES (77110, 'Titanica', 'Luxembourgish', 132, '2000s', 10, 'X', 'Cassondra Saket', '26-07-2009', 78752, 99108, 73666);
INSERT INTO movie_data VALUES (37706, 'Grown Ups 2', 'Ndebele', 126, '62000s', 3, 'PG', 'Kristian Dirand', '26-08-1994', 78752, 80699, 23747);
INSERT INTO movie_data VALUES (67294, 'Friendship!', 'Estonian', 145, '2020s', 6, 'R', 'Bendick Doogue', '10-03-1991', 78752, 38272, 73666);
INSERT INTO movie_data VALUES (55745, 'Taxi', 'Malayalam', 191, '1970s', 8, 'R', 'Julie Artois', '05-07-1981', 54217, 00564, 23747);
INSERT INTO movie_data VALUES (16088, 'Divine Madness!', 'New Zealand Sign Language', 122, '1960s', 8, 'PG-13', 'Wit Oluwatoyin', '16-01-2000', 54217, 91399, 87626);
INSERT INTO movie_data VALUES (22485, 'Trek Nation', 'Hungarian', 141, '1650s', 9, 'PG-13', 'Corrina Daingerfield', '21-07-2020', 54217, 27562, 74570);
INSERT INTO movie_data VALUES (48639, 'Edge of Madness', 'Tamil', 110, '1800s', 10, 'PG', 'Erika Causton', '18-10-1994', 78330, 75677, 73666);
INSERT INTO movie_data VALUES (71658, 'Tom, Tom, the Piper''s Son', 'Hebrew', 176, 'R', 4, '1890s', 'Conney Birrel', '09-10-2021', 78330, 38272, 87626);
INSERT INTO movie_data VALUES (36138, 'Inquire Within', 'Kannada', 136, '1900s', 8, 'R', 'Dan McDade', '19-06-2020', 78330, 43668, 73666);
INSERT INTO movie_data VALUES (73463, 'Train of Shadows (Tren de sombras)', 'Tamil', 196, '2010s', 10, 'G', 'Candi Espinho', '19-06-1981', 78330, 15547, 85307);

# moviesubmitter table
CREATE TABLE submitter_data (
	employee_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	salary VARCHAR(50),
	address_street VARCHAR(50),
	address_city VARCHAR(50),
	address_state VARCHAR(50),
	address_zip VARCHAR(50),
	address_country VARCHAR(50),
	supervisor_id INTEGER
);

INSERT INTO submitter_data VALUES (24249, 'Ali', 'Sankey', '$50777.14', '957 Jana Drive', 'Evansville', 'Indiana', '47725', 'United States', null);
INSERT INTO submitter_data VALUES (35913, 'Hoyt', 'Hartburn', '$49342.22', '6859 Del Sol Lane', 'Grand Forks', 'North Dakota', '58207', 'United States', 24249);
INSERT INTO submitter_data VALUES (78752, 'Barnaby', 'Starkings', '$96210.1', '07 4th Crossing', 'Corona', 'California', '92883', 'United States', 24249);
INSERT INTO submitter_data VALUES (54217, 'Evangelia', 'Sprull', '$78076.91', '1341 Maywood Parkway', 'Miami', 'Florida', '33169', 'United States', 35913);
INSERT INTO submitter_data VALUES (78330, 'Godiva', 'Petley', '$44464.69', '34027 Merchant Drive', 'Vienna', 'Virginia', '22184', 'United States', 35913);

# genre table
CREATE TABLE genre_data (
	genre_id INTEGER PRIMARY KEY,
	name VARCHAR(50)
);

INSERT INTO genre_data VALUES (73666, 'Thriller');
INSERT INTO genre_data VALUES (74570, 'Mystery');
INSERT INTO genre_data VALUES (23747, 'Children');
INSERT INTO genre_data VALUES (87626, 'Documentary');
INSERT INTO genre_data VALUES (85307, 'Crime');

# triggerwarning table
create table trigger_warning_data (
	movie_id INTEGER,
    warning_name VARCHAR(50) PRIMARY KEY,
    intensity INTEGER,
    CONSTRAINT trigger_warning_fk_1 FOREIGN KEY (movie_id) REFERENCES movie_data (movie_id)
);

INSERT INTO trigger_warning_data VALUES (21348, 'Violence', 8);
INSERT INTO trigger_warning_data VALUES (21348, 'Foul Language', 1);
INSERT INTO trigger_warning_data VALUES (44174, 'Nudity', 7);
INSERT INTO trigger_warning_data VALUES (36296, 'Gun Violence', 3);
INSERT INTO trigger_warning_data VALUES (37706, 'Foul Language', 8);
INSERT INTO trigger_warning_data VALUES (37706, 'Sexual Content', 4);
INSERT INTO trigger_warning_data VALUES (71658, 'Sexual Content', 3);
INSERT INTO trigger_warning_data VALUES (36138, 'Nudity', 6);
INSERT INTO trigger_warning_data VALUES (73463, 'Sexual Assault', 3);
INSERT INTO trigger_warning_data VALUES (62679, 'Foul Language', 5);
INSERT INTO trigger_warning_data VALUES (77110, 'Foul Language', 9);
INSERT INTO trigger_warning_data VALUES (39933, 'Foul Language', 4);


# director table
create table director_data (
	director_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	experience_level VARCHAR(50)
);

INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (91399, 'Simone', 'Strutz', 9);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (79580, 'Freedman', 'Pittford', 7.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (85682, 'Darcie', 'Pratt', 4.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (75677, 'Mirella', 'Garrit', 4);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (65725, 'Clare', 'Fairtlough', 8);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (27562, 'Breena', 'Babar', 3.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (87452, 'Klement', 'MacPike', 8);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (15547, 'Carmella', 'Wassung', 9.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (47030, 'Earlie', 'Mougenel', 9.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (80699, 'Noelle', 'Neeson', 5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (77438, 'Nikolos', 'Dower', 4);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (00564, 'Marrion', 'Elton', 7.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (86404, 'Monique', 'Wearn', 2);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (83007, 'Barny', 'Turland', 4.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (43668, 'Chevy', 'Villar', 9.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (99108, 'Jarret', 'Humphrey', 7.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (50612, 'Rudiger', 'Georgius', 6);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (38272, 'Lucina', 'Colbourn', 5.5);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (80903, 'Jocko', 'Sutherns',  6);
INSERT INTO director_data (director_id, first_name, last_name, experience_level) VALUES (33006, 'Lannie', 'Weatherup', 9);

# movie purchase table
create table movie_purchase_data (
	movie_id INTEGER,
	user_id INTEGER,
	price VARCHAR(50),
	user_rating INTEGER,
	watch_time INTEGER,
    CONSTRAINT movie_purchase_fk_1 FOREIGN KEY (user_id) REFERENCES user_data (user_id)
);

INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (44174, 85739, '$0.50', 2, 95);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (67294, 00087, '$8.71', 10, 71);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (16088, 74803, '$1.81', 1, 71);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (35474, 85739, '$6.48', 5, 136);
INSERT INTO movie_purchase_data (movie_id, user_id, price, user_rating, watch_time) VALUES (73463, 33845, '$8.43', 8, 62);

# similar movie table
create table similar_movie_data (
	movie_id INTEGER,
	similar_to_id INTEGER,
    CONSTRAINT similar_movie_fk_1 FOREIGN KEY (movie_id, similar_to_id) REFERENCES movie_data (movie_id)
);

INSERT INTO similar_movie_data (movie_id, similar_to_id) VALUES (22485, 23704);
INSERT INTO similar_movie_data (movie_id, similar_to_id) VALUES (21348, 20745);
INSERT INTO similar_movie_data (movie_id, similar_to_id) VALUES (22485, 99498);
INSERT INTO similar_movie_data (movie_id, similar_to_id) VALUES (67294, 87959);
INSERT INTO similar_movie_data (movie_id, similar_to_id) VALUES (71658, 67950);

# actor table
create table actor_data (
	actor_id INTEGER PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	active_since INTEGER,
	age INTEGER
);

INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (04947, 'Rafaelia', 'Stanbury', 2007, 69);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (20103, 'Shellysheldon', 'Yarwood', 1990, 60);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (54608, 'Stephani', 'Ewin', 1995, 63);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (06853, 'Ernie', 'Tigwell', 2010, 76);
INSERT INTO actor_data (actor_id, first_name, last_name, active_since, age) VALUES (67904, 'Trace', 'Sotham', 2008, 76);


# movie actor table
create table movie_actor_data (
	movie_id INTEGER,
	actor_id INTEGER PRIMARY KEY,
	character_name VARCHAR(50),
    CONSTRAINT movie_actor_fk_1 FOREIGN KEY (movie_id) REFERENCES movie_data (movie_id),
    CONSTRAINT movie_actor_fk_1 FOREIGN KEY (actor_id) REFERENCES actor_data (actor_id)
);
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (62679, 04947, 'Helyn');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (22485, 06853, 'Bart');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (16088, 67904, 'Tabor');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (36138, 04947, 'Renee');
INSERT INTO movie_actor_data (movie_id, actor_id, character_name) VALUES (44174, 20103, 'Sonnie');

