DROP DATABASE IF EXISTS soccer_league_db;
CREATE DATABASE soccer_league_db;
\c soccer_league_db;

CREATE TABLE teams
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    wins INTEGER DEFAULT 0,
    losses INTEGER DEFAULT 0
);

CREATE TABLE seasons
(
    id SERIAL PRIMARY KEY,
    season_start DATE NOT NULL,
    season_end DATE NOT NULL
);

CREATE TABLE players
(
    id SERIAL PRIMARY KEY,
    name TEXT UNIQUE NOT NULL,
    team_id INTEGER REFERENCES teams ON DELETE SET NULL
);

CREATE TABLE games
(
    id SERIAL PRIMARY KEY,
    team_1 INTEGER REFERENCES teams NOT NULL,
    team_2 INTEGER REFERENCES teams NOT NULL,
    game_date DATE NOT NULL
);

CREATE TABLE goals
(
    id SERIAL PRIMARY KEY NOT NULL,
    player_id INTEGER REFERENCES players,
    game_id INTEGER REFERENCES games
);


INSERT INTO teams (name) VALUES
('Panthers'),
('Raiders'),
('Red Shorts');

INSERT INTO players (name, team_id) VALUES
('DBrickishaw Ferguson', 2),
('Joe Biden', 2),
('Clint Eastwood', 2);

