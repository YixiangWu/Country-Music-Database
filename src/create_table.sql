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
