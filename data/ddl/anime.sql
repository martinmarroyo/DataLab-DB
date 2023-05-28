/* Creates the tables for the anime schema */
CREATE TABLE IF NOT EXISTS anime.all_anime (
    id INT,
    title TEXT,
    status TEXT,
    rating TEXT,
    score DOUBLE PRECISION,
    favorites INT,
    load_date DATE,
    airing BOOLEAN,
    aired_from DATE,
    aired_to DATE
);

CREATE TABLE IF NOT EXISTS anime.anime_scores (
    anime_id INT,
    score INT,
    votes INT,
    percentage DOUBLE PRECISION,
    load_date TIMESTAMP
);

CREATE TABLE IF NOT EXISTS anime.anime_stats (
    anime_id INT,
    watching INT,
    completed INT,
    on_hold INT,
    dropped INT,
    plan_to_watch INT,
    total INT,
    load_date TIMESTAMP
);

CREATE TABLE IF NOT EXISTS anime.dim_anime (
    anime_key BIGSERIAL,
    anime_id INT,
    anime_title TEXT,
    status TEXT,
    rating TEXT,
    airing BOOLEAN,
    aired_from DATE,
    aired_to DATE,
    is_current BOOLEAN,
    current_as_of DATE,
    expired DATE
);

CREATE TABLE IF NOT EXISTS anime.fact_anime_scores (
    anime_id INT,
    score INT,
    votes INT,
    percentage DOUBLE PRECISION,
    load_date DATE,
    anime_key BIGINT
);

CREATE TABLE IF NOT EXISTS anime.fact_anime_stats (
    anime_id INT,
    watching INT,
    completed INT,
    on_hold INT,
    dropped INT,
    plan_to_watch INT,
    total INT,
    load_date DATE,
    avg_score DOUBLE PRECISION,
    favorites INT,
    anime_key BIGINT
);