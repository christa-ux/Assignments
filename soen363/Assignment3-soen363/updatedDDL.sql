
/*Ran this command to modify Movie table*/

SELECT
  m.*,
  string_agg(DISTINCT g.gname, ', ') AS genre_names,
  string_agg(DISTINCT l.lName, ', ') AS language_names,
  string_agg(DISTINCT a.aka_title, ', ') AS aka_titles
FROM
  "Movie" m
  LEFT JOIN moviegenre mg ON m.mID = mg.movieID
  LEFT JOIN Genre g ON mg.genreID = g.gID
  LEFT JOIN Movielanguage ml ON m.mID = ml.movieID
  LEFT JOIN Language l ON ml.languageID = l.lCode
  LEFT JOIN Movieaka ma ON m.mID = ma.movieID
  LEFT JOIN AKA a ON ma.akaID = a.akaID

GROUP BY
  m.mID;




/*Initial movie table from assignment 2*/

CREATE TABLE "Movie" (  
    mID SERIAL PRIMARY KEY, 
    tmdbID INTEGER NOT NULL UNIQUE,    
    imdbID INTEGER UNIQUE,   
    watchmodeID INTEGER,   
    title VARCHAR(100) NOT NULL, 
    plot VARCHAR(500) NOT NULL,
    content_Rating VARCHAR(10) NOT NULL, 
    viewerRating NUMERIC(3, 1) CHECK (viewerRating >= 0 AND viewerRating <= 10),
    releaseYear INT CHECK (releaseYear >= 1888 AND releaseYear <= EXTRACT(YEAR FROM CURRENT_DATE)),  
    original_language VARCHAR(50) NOT NULL, 
    FOREIGN KEY (content_Rating) REFERENCES contentRating (rating)
);


/* also deleted the following tables: Director, Genre, Language, AKA,
 Moviedirector, Moviaka, movielanguage, Moviegenre. 


 the rest of the tables are the same (see below: )*/
CREATE TABLE Actor (   --entity Actor (just kept first name and last name)
    aID SERIAL PRIMARY KEY, 
    aFirst VARCHAR(30) NOT NULL, 
    aLast VARCHAR(50) NOT NULL, 
    CONSTRAINT unique_actor_name UNIQUE (aFirst, aMiddle, aLast) 


); 


CREATE TABLE Country (  
    countryCode CHAR(2) PRIMARY KEY,
    countryName VARCHAR(50) NOT NULL
);


CREATE TABLE Keyword (   
    kID SERIAL PRIMARY KEY,
    keyword VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE Moviecountry (  
    movieID INTEGER NOT NULL,
    countryCode CHAR(2) NOT NULL,
    PRIMARY KEY (movieID, countryCode), 
    FOREIGN KEY (movieID) REFERENCES Movie (mID),
    FOREIGN KEY (countryCode) REFERENCES Country (countryCode)
);

CREATE TABLE Moviekeyword (  
    movieID INTEGER NOT NULL,
    keywordID INTEGER NOT NULL,
    PRIMARY KEY (movieID, keywordID), 
    FOREIGN KEY (movieID) REFERENCES Movie (mID),
    FOREIGN KEY (keywordID) REFERENCES Keyword (kID)
);

CREATE TABLE movieactor (  
    movieID INTEGER NOT NULL, 
    actorID INTEGER NOT NULL,
    PRIMARY KEY (movieID, actorID),   
    FOREIGN KEY (movieID) REFERENCES Movie (mID), 
    FOREIGN KEY (actorID) REFERENCES Actor (aID)
);




