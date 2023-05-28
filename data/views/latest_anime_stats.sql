-- vw_latest_anime_stats
CREATE MATERIALIZED VIEW anime.vw_latest_anime_stats AS
WITH latest_facts AS (
    SELECT fact_anime_stats.*
    FROM anime.fact_anime_stats
    INNER JOIN(
        SELECT anime_key, MAX(load_date) AS date
        FROM anime.fact_anime_stats
        GROUP BY anime_key
    ) latest
    ON fact_anime_stats.anime_key=latest.anime_key
    AND fact_anime_stats.load_date=latest.date
)
SELECT
    latest_facts.anime_key,
    dim_anime.anime_id,
    dim_anime.anime_title,
    dim_anime.status,
    dim_anime.rating,
    dim_anime.airing,
    dim_anime.aired_from,
    dim_anime.aired_to,
    latest_facts.avg_score,
    latest_facts.favorites,
    latest_facts.watching,
    latest_facts.completed,
    latest_facts.on_hold,
    latest_facts.dropped,
    latest_facts.plan_to_watch,
    latest_facts.total,
    latest_facts.load_date
FROM latest_facts, anime.dim_anime
WHERE latest_facts.anime_key=dim_anime.anime_key
    AND dim_anime.is_current
ORDER BY anime_id;

CREATE INDEX idx_anime_title ON anime.vw_latest_anime_stats(anime_title);
CREATE INDEX idx_anime_key ON anime.vw_latest_anime_stats(anime_key);