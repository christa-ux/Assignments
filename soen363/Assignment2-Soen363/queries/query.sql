
--part 7

--A 
SELECT 
    COUNT(CASE WHEN "imdbID" IS NOT NULL THEN 1 END) AS with_imdb_id,
    COUNT(CASE WHEN "imdbID" IS NULL THEN 1 END) AS without_imdb_id
FROM "Movie";


--B
SELECT 
    m."tmdbID", 
    m."imdbID", 
    m.title, 
    m."releaseYear", 
    m."watchmodeID"
FROM 
    "Movie" m
JOIN 
    "Movieactor" ma ON m."mID" = ma.movieID
JOIN 
    "Actor" a ON ma.actorID = a.aID
WHERE 
    a.aFirst = 'ActorFirstName' AND a.aLast = 'ActorLastName'
    AND m."releaseYear" BETWEEN 2000 AND 2020;


--C
SELECT
    "tmdbID",
    "imdbID",
    title,
    "releaseYear",
    "viewerRating"
FROM "Movie"
ORDER BY "viewerRating" DESC
LIMIT 3;

--D
SELECT 
    COUNT(*) AS multi_language_movie_count
FROM (
    SELECT 
        m."mID"
    FROM 
        "Movie" m
    JOIN 
        "Movielanguage" ml ON m."mID" = ml.movieID
    GROUP BY 
        m."mID"
    HAVING 
        COUNT(ml.languageID) > 1
) AS multi_lang_movies;



--E
SELECT 
    l.lName AS language, 
    COUNT(ml.movieID) AS movie_count
FROM 
    "Language" l
JOIN 
    "Movielanguage" ml ON l.lCode = ml.languageID
GROUP BY 
    l.lName
ORDER BY 

    movie_count DESC;


--F
SELECT 
    m.title, 
    m."viewerRating"
FROM 
    "Movie" m
JOIN 
    "Moviegenre" mg ON m."mID" = mg.movieID
JOIN 
    "Genre" g ON mg.genreID = g.gID
WHERE 
    g.gname = 'Comedy'
ORDER BY 
    m."viewerRating" DESC
LIMIT 2;


--G
UPDATE Movie
SET viewerRating = CEIL(viewerRating);



