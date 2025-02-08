
--part 1: 

-- In a M-to-N relationship, we have 3 tables 
--      -->(2 being the entities, and one being the relationship)

--In a 1-to-1 or 1-to-N relationship, we only have 2 tables, with foreign keys in the weak entity


CREATE TABLE Genre (   --entity Genre
    gID SERIAL PRIMARY KEY, 
    gname VARCHAR(50) NOT NULL  
);

CREATE TABLE Actor (   --entity Actor
    aID SERIAL PRIMARY KEY, 
    aAge INT CHECK (aAge >= 1 AND aAge <= 120),  -- Assuming max age is 120 
    aFirst VARCHAR(30) NOT NULL, 
    aMiddle VARCHAR(30),  
    aLast VARCHAR(50) NOT NULL, 
    aCountry VARCHAR(30) NOT NULL, 
    CONSTRAINT unique_actor_name UNIQUE (aFirst, aMiddle, aLast) 
-- 2 actors can have the same first name, OR the same last name, OR the same middle name, or a combination of 2, 
--but they can't have all 3 the same. 

); 

CREATE TABLE Director (   --entity Director
    dID SERIAL PRIMARY KEY, 
    dAge INT CHECK (dAge >= 1 AND dAge <= 120), 
    dFirst VARCHAR(30) NOT NULL, 
    dMiddle VARCHAR(30), 
    dLast VARCHAR(50) NOT NULL, 
    dCountry VARCHAR(30) NOT NULL, 
    CONSTRAINT unique_director_name UNIQUE (dFirst, dMiddle, dLast)
);


CREATE TABLE AKA (  --entity AKA
    akaID SERIAL PRIMARY KEY,
    aka_title VARCHAR(100) NOT NULL
);


CREATE TABLE Country (   --entity Country; it refers to the scenes where the movie was filmed
    countryCode CHAR(2) PRIMARY KEY,
    countryName VARCHAR(50) NOT NULL
);


CREATE TABLE Language (   --entity Language
    lCode CHAR(2) PRIMARY KEY,
    lName VARCHAR(50) NOT NULL
);



CREATE TABLE Keyword (   --entity Keyword
    kID SERIAL PRIMARY KEY,
    keyword VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE contentRating (   -- using MPAA (options are: G, PG, PG-13, R, NC-17)
    rID SERIAL PRIMARY KEY,
    rating VARCHAR(10) UNIQUE NOT NULL  
);

CREATE TABLE "Movie" (   --entity Movie
    mID SERIAL PRIMARY KEY, 
    tmdbID INTEGER NOT NULL UNIQUE,    -- Required TMDB ID
    imdbID INTEGER UNIQUE,   -- Optional IMDB ID
    watchmodeID INTEGER,   -- Optional Watchmode ID
    title VARCHAR(100) NOT NULL, 
    plot VARCHAR(500) NOT NULL,
    content_Rating VARCHAR(10) NOT NULL,   -- Foreign key 
    viewerRating NUMERIC(3, 1) CHECK (viewerRating >= 0 AND viewerRating <= 10), -- Viewers rating (can go from 0 to 10, with 1 decimal)
    releaseYear INT CHECK (releaseYear >= 1888 AND releaseYear <= EXTRACT(YEAR FROM CURRENT_DATE)),  -- Oldest movie was made in 1888
    original_language VARCHAR(50) NOT NULL, 
    FOREIGN KEY (content_Rating) REFERENCES contentRating (rating)
);



CREATE TABLE Movieaka (   --relation between Movie and AKA; M-to-N
    movieID INTEGER NOT NULL,
    akaID INTEGER NOT NULL,
    PRIMARY KEY (movieID, akaID),   --composite 
    FOREIGN KEY (movieID) REFERENCES Movie (mID) ON DELETE CASCADE,
    FOREIGN KEY (akaID) REFERENCES AKA (akaID) ON DELETE CASCADE
);



CREATE TABLE Moviecountry (   --relation between Movie and Country; M-to-N
    movieID INTEGER NOT NULL,
    countryCode CHAR(2) NOT NULL,
    PRIMARY KEY (movieID, countryCode), --composite 
    FOREIGN KEY (movieID) REFERENCES Movie (mID),
    FOREIGN KEY (countryCode) REFERENCES Country (countryCode)
);





CREATE TABLE Movielanguage (   --relation between Movie and Language; M-to-N
    movieID INTEGER NOT NULL,
    languageID CHAR(2) NOT NULL,
    PRIMARY KEY (movieID, languageID), --composite 
    FOREIGN KEY (movieID) REFERENCES Movie (mID),
    FOREIGN KEY (languageID) REFERENCES Language (lCode)
);


CREATE TABLE Moviekeyword (   --relation between Movie and Keyword
    movieID INTEGER NOT NULL,
    keywordID INTEGER NOT NULL,
    PRIMARY KEY (movieID, keywordID), --composite 
    FOREIGN KEY (movieID) REFERENCES Movie (mID),
    FOREIGN KEY (keywordID) REFERENCES Keyword (kID)
);

CREATE TABLE moviegenre (   --relation between Movie and Genre; M-to-N
    movieID INTEGER NOT NULL, 
    genreID INTEGER NOT NULL, 
    PRIMARY KEY (movieID, genreID),    -- Composite 
    FOREIGN KEY (genreID) REFERENCES Genre (gID), 
    FOREIGN KEY (movieID) REFERENCES Movie (mID)
);

CREATE TABLE movieactor (   --relation between Movie and Actor; M-to-N
    movieID INTEGER NOT NULL, 
    actorID INTEGER NOT NULL,
    PRIMARY KEY (movieID, actorID),    -- Composite
    FOREIGN KEY (movieID) REFERENCES Movie (mID), 
    FOREIGN KEY (actorID) REFERENCES Actor (aID)
);

CREATE TABLE moviedirector (   --relation between Movie and Director; M-to-N
    movieID INTEGER NOT NULL, 
    directorID INTEGER NOT NULL,
    PRIMARY KEY (movieID, directorID),     -- Composite 
    FOREIGN KEY (movieID) REFERENCES Movie (mID), 
    FOREIGN KEY (directorID) REFERENCES Director (dID)
);
