CREATE TABLE artist_rankings (
    year INTEGER,
    rank INTEGER,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    stage_name VARCHAR(50),
    best_song_for_the_year VARCHAR(100)
);

COPY artist_rankings FROM '/path/to/artist_rankings.csv' WITH (FORMAT CSV, HEADER);


CREATE TABLE demographics (
    first_name VARCHAR(50),
    middle_name VARCHAR(50),
    last_name VARCHAR(50),
    nickname VARCHAR(50),
    pseudonym VARCHAR(50),
    date_of_birth DATE,
    place_of_birth VARCHAR(50),
    gender VARCHAR(10),
    ethnicity VARCHAR(50),
    net_worth_2023 INTEGER,
    education VARCHAR(50),
    highest_degree VARCHAR(50)
);

COPY demographics FROM '/path/to/demographics.csv' WITH (FORMAT CSV, HEADER);


CREATE TABLE discography (
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    stage_name VARCHAR(50),
    album VARCHAR(100),
    year INTEGER,
    genre VARCHAR(50),
    number_of_songs INTEGER,
    label VARCHAR(100),
    sales INTEGER,
    "top_hits_in_the_album_(year-rank)" VARCHAR(250)
);

COPY discography FROM '/path/to/discography.csv' WITH (FORMAT CSV, HEADER);


CREATE TABLE song_rankings (
    year INTEGER,
    rank INTEGER,
    song VARCHAR(100),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    stage_name VARCHAR(50)
);

COPY song_rankings FROM '/path/to/song_rankings.csv' WITH (FORMAT CSV, HEADER);
