-- Display the impact of album label on its sales
SELECT
    label,
    COUNT(*) AS counts,
    ROUND(AVG(sales)::NUMERIC) AS average_sales
FROM discography
GROUP BY label
HAVING ROUND(AVG(sales)::NUMERIC) IS NOT NULL;


-- Display the impact of artists' place of birth on their music genre
SELECT
    demographics.first_name,
    demographics.last_name,
    demographics.pseudonym,
    demographics.place_of_birth,
    discography.album,
    discography.genre
FROM demographics
INNER JOIN discography ON
    (demographics.first_name = discography.first_name AND
    demographics.last_name = discography.last_name) OR
    demographics.pseudonym = discography.stage_name;


-- Display the impact of artists' education and highest degree
SELECT
    demographics.first_name,
    demographics.last_name,
    demographics.pseudonym,
    demographics.education,
    demographics.highest_degree,
    artist_rankings.rank,
    artist_rankings.year AS year_of_rank
FROM demographics
INNER JOIN artist_rankings ON
    (demographics.first_name = artist_rankings.first_name AND
    demographics.last_name = artist_rankings.last_name) OR
    demographics.pseudonym = artist_rankings.stage_name;


-- Display artists with their most frequent genre
WITH ranked_genre_counts AS (
    SELECT
        COALESCE(stage_name, CONCAT(first_name, ' ', last_name)) AS pseudonym,
        genre,
        RANK() OVER (PARTITION BY COALESCE(stage_name, CONCAT(first_name, ' ', last_name)) ORDER BY COUNT(genre) DESC) as rank
    FROM discography
    GROUP BY pseudonym, genre
),
most_frequent_genre AS (
    SELECT
        pseudonym,
        genre AS most_frequent_genre
    FROM ranked_genre_counts
    WHERE rank = 1
)

SELECT
    pseudonym,
    MIN(most_frequent_genre)  -- MIN() is here to solve for ranking ties
FROM most_frequent_genre
GROUP BY pseudonym;


-- Display artists with their signature ablum and best of rank
WITH best_rank AS (
    SELECT
        COALESCE(stage_name, CONCAT(first_name, ' ', last_name)) AS pseudonym,
        MIN(rank) AS best_rank
    FROM artist_rankings
    GROUP BY pseudonym
),
albums_ranked_via_sales AS (
    SELECT 
        COALESCE(stage_name, CONCAT(first_name, ' ', last_name)) AS pseudonym,
        album, 
        RANK() OVER (PARTITION BY COALESCE(stage_name, CONCAT(first_name, ' ', last_name)) ORDER BY sales DESC) as rank
    FROM discography
),
signature_ablum AS (
    SELECT
        pseudonym,
        album AS signature_ablum
    FROM albums_ranked_via_sales
    WHERE rank = 1
)

SELECT 
    best_rank.pseudonym,
    MIN(signature_ablum.signature_ablum),  -- MIN() is here to solve for ranking ties
    best_rank.best_rank
FROM best_rank
INNER JOIN signature_ablum ON best_rank.pseudonym = signature_ablum.pseudonym
GROUP BY
    best_rank.pseudonym, best_rank.best_rank;