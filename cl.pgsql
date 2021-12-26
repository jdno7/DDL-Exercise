DROP DATABASE IF EXISTS craigs_list_db;
CREATE DATABASE craigs_list_db;
\c craigs_list_db;


CREATE TABLE region
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL 
);

CREATE TABLE categories
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL 
);

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    user_name TEXT UNIQUE NOT NULL,
    pref_region_id INTEGER REFERENCES region
);

CREATE TABLE posts
(
    id SERIAL PRIMARY KEY,
    title TEXT,
    txt VARCHAR(50),
    user_id INTEGER REFERENCES users NOT NULL,
    location TEXT,
    region_id INTEGER REFERENCES region,
    post_category INTEGER REFERENCES categories 
);

INSERT INTO region (name) VALUES
('NORTH'),
('SOUTH'),
('EAST'),
('WEST');

INSERT INTO categories (name) VALUES
('Vehicle'),
('Sporting Goods'),
('Toys'),
('Tools');

INSERT INTO users (user_name, pref_region_id) VALUES
('clark_griswold', 1),
('charlie_sheen',1),
('will_smith', 2),
('billy_bob', 2);

INSERT INTO posts (title, txt, user_id, location, region_id, post_category) VALUES
('CAR FOR SALE', '1984 Honda with 100,000 miles', 1, 'Dalls', 2, 1);
