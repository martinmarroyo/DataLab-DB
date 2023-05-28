-- All Anime 
    COMMENT ON TABLE anime.all_anime
        IS 'All suitable for work anime titles from My Anime List';

    COMMENT ON COLUMN anime.all_anime.id
        IS 'The My Anime List id of the anime';

    COMMENT ON COLUMN anime.all_anime.title
        IS 'The title of the anime';

    COMMENT ON COLUMN anime.all_anime.status
        IS 'Airing status ("Finished Airing" "Currently Airing" "Not yet aired")';

    COMMENT ON COLUMN anime.all_anime.rating
        IS 'Anime audience rating ("G - All Ages" "PG - Children" "PG-13 - Teens 13 or older" "R - 17+ (violence & profanity)" "R+ - Mild Nudity" "Rx - Hentai")';

    COMMENT ON COLUMN anime.all_anime.score
        IS 'Average fan rating (out of 10)';

    COMMENT ON COLUMN anime.all_anime.favorites
        IS 'Number of users who have favorited this entry';

    COMMENT ON COLUMN anime.all_anime.airing
        IS 'Indicates whether an anime is currently airing';

    COMMENT ON COLUMN anime.all_anime.aired_from
        IS 'Date that anime first started airing';

    COMMENT ON COLUMN anime.all_anime.aired_to
        IS 'Date that anime stopped airing if off the air';
    -- Anime Scores
    COMMENT ON TABLE anime.anime_scores
        IS 'A collection of scores rating the popularity of a given anime on a scale of 1-10';
    
    COMMENT ON COLUMN anime.anime_scores.anime_id
        IS 'The id of the anime';

    COMMENT ON COLUMN anime.anime_scores.score
        IS 'Scoring value';

    COMMENT ON COLUMN anime.anime_scores.votes
        IS 'Number of votes for this score';

    COMMENT ON COLUMN anime.anime_scores.percentage
        IS 'Percentage of votes for this score';

    COMMENT ON COLUMN anime.anime_scores.load_date
        IS 'Date/time that scores were extracted and loaded';

    -- Anime Stats
    COMMENT ON TABLE anime.anime_stats
        IS 'A collection of anime statistics from MyAnimeList';

    COMMENT ON COLUMN anime.anime_stats.anime_id
        IS 'The id of the anime';

    COMMENT ON COLUMN anime.anime_stats.watching
        IS 'Number of users watching the resource';

    COMMENT ON COLUMN anime.anime_stats.completed
        IS 'Number of users who have completed the resource';

    COMMENT ON COLUMN anime.anime_stats.on_hold
        IS 'Number of users who have put the resource on hold';

    COMMENT ON COLUMN anime.anime_stats.dropped
        IS 'Number of users who have dropped the resource';

    COMMENT ON COLUMN anime.anime_stats.plan_to_watch
        IS 'Number of users who have planned to watch the resource';

    COMMENT ON COLUMN anime.anime_stats.total
        IS 'Total number of users who have the resource added to their lists';

    COMMENT ON COLUMN anime.anime_stats.load_date
        IS 'Date/time that stats were extracted and loaded'; 