--part6

CREATE VIEW movie_summary AS
SELECT 
    m."tmdbID",
    m."imdbID",
    m.title,
    m.plot AS description,
    m."content_Rating",
    COUNT(DISTINCT mk.keywordID) AS num_keywords,
    COUNT(DISTINCT mc.countryCode) AS num_countries
FROM 
    "Movie" m
LEFT JOIN 
    "Moviekeyword" mk ON m."mID" = mk.movieID
LEFT JOIN 
    "Moviecountry" mc ON m."mID" = mc.movieID
GROUP BY 
    m."tmdbID", m."imdbID", m.title, m.plot, m."content_Rating";
