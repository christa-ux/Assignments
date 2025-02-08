--part 5:

INSERT INTO Genre (gname) VALUES 
('Action'), ('Drama'), ('Comedy'), ('Thriller'), ('Horror'), ('Adventure'), 
('Sci-Fi'), ('Fantasy'), ('Mystery'), ('Romance');


INSERT INTO "Actor" (aAge, aFirst, aMiddle, aLast, aCountry) VALUES 
(45, 'Robert', NULL, 'Downey Jr.', 'US'), 
(38, 'Scarlett', NULL, 'Johansson', 'US'), 
(52, 'Chris', NULL, 'Hemsworth', 'AU'), 
(39, 'Zoe', NULL, 'Saldana', 'DO'), 
(44, 'Leonardo', NULL, 'DiCaprio', 'US'),
(50, 'Johnny', NULL, 'Depp', 'US'),
(60, 'Morgan', NULL, 'Freeman', 'US'),
(41, 'Will', NULL, 'Smith', 'US'),
(37, 'Charlize', NULL, 'Theron', 'ZA'),
(50, 'Tom', NULL, 'Cruise', 'US');


INSERT INTO "Director" (dAge, dFirst, dMiddle, dLast, dCountry) VALUES 
(60, 'Steven', NULL, 'Spielberg', 'US'), 
(52, 'Christopher', NULL, 'Nolan', 'UK'), 
(55, 'James', NULL, 'Cameron', 'CA'), 
(74, 'Martin', NULL, 'Scorsese', 'US'), 
(59, 'Quentin', NULL, 'Tarantino', 'US'),
(45, 'JJ', NULL, 'Abrams', 'US'),
(58, 'Ridley', NULL, 'Scott', 'US'),
(47, 'Denis', NULL, 'Villeneuve', 'CA'),
(54, 'David', NULL, 'Fincher', 'US'),
(70, 'Clint', NULL, 'Eastwood', 'US');


INSERT INTO "AKA" (aka_title) VALUES 
('The Avengers'), 
('Avengers Assemble'), 
('The Titanic'), 
('Inception'), 
('The Dark Knight'),
('The Matrix'), 
('Pulp Fiction'), 
('The Godfather'), 
('Star Wars: A New Hope'), 
('Interstellar'),
('The Lord of the Rings: The Return of the King'),
('Gladiator'),
('Jurassic Park'),
('The Terminator'),
('Mad Max: Fury Road'),
('The Wolf of Wall Street'),
('The Prestige'),
('Shutter Island'),
('The Revenant'),
('Inglourious Basterds'),
('The Social Network'),
('Spider-Man: No Way Home'),
('Guardians of the Galaxy'),
('The Martian'),
('Avatar'),
('Fight Club'),
('Goodfellas'),
('The Dark Knight Rises'),
('The Lion King'),
('Frozen'),
('The Pursuit of Happyness'),
('The Godfather: Part II'),
('The Shawshank Redemption'),
('Star Wars: The Empire Strikes Back'),
('Back to the Future'),
('The Silence of the Lambs'),
('Se7en'),
('The Matrix Revolutions'),
('Blade Runner 2049'),
('The Hateful Eight'),
('Jurassic World'),
('The Bourne Identity'),
('The Iron Giant'),
('Ocean Eleven'),
('The Incredibles'),
('The Exorcist'),
('Star Wars: Return of the Jedi'),
('Pirates of the Caribbean: The Curse of the Black Pearl');


INSERT INTO "Country" (countryCode, countryName) VALUES 
('US', 'United States'), 
('UK', 'United Kingdom'), 
('AU', 'Australia'), 
('CA', 'Canada'), 
('IN', 'India'),
('FR', 'France'),
('DE', 'Germany'),
('IT', 'Italy'),
('ES', 'Spain'),
('BR', 'Brazil');


INSERT INTO "Language" (lCode, lName) VALUES 
('EN', 'English'), 
('FR', 'French'), 
('ES', 'Spanish'), 
('IT', 'Italian'), 
('DE', 'German'),
('RU', 'Russian'),
('PT', 'Portuguese'),
('AR', 'Arabic'),
('CN', 'Chinese'),
('JA', 'Japanese');

INSERT INTO "Keyword" (keyword) VALUES 
('superhero'), ('war'), ('dream'), ('future'), ('ocean'), 
('space'), ('AI'), ('detective'), ('crime'), ('love'),
('survival'), ('adventure'), ('family'), ('zombies'), ('robot'),
('fantasy'), ('history'), ('action'), ('mystery'), ('thriller'),
('violence'), ('romance'), ('comedy'), ('drama'), ('betrayal'),
('revenge'), ('courtroom'), ('psychological'), ('sci-fi'), ('journey');


INSERT INTO "contentRating" (rating) VALUES 
('G'), ('PG'), ('PG-13'), ('R'), ('NC-17');


INSERT INTO "Movie" ("tmdbID", "imdbID", "watchmodeID", title, plot, "content_Rating", "viewerRating", "releaseYear", "original_language") VALUES
(1, 12345, 111, 'The Avengers', 'Earth mightiest heroes must come together to fight as a team.', 'PG-13', 8.1, 2012, 'English'),
(2, 12346, NULL, 'Titanic', 'A love story doomed by the sinking of a ship.', 'PG-13', 7.8, 1997, 'English'),
(3, 12347, 112, 'Inception', 'A thief steals corporate secrets through dream-sharing technology.', 'PG-13', 8.8, 2010, 'English'),
(4, 12348, NULL, 'The Dark Knight', 'Batman faces the Joker in a battle for Gotham.', 'PG-13', 9.0, 2008, 'English'),
(5, 12349, 113, 'Avatar', 'A marine on an alien planet fights for survival.', 'PG-13', 7.9, 2009, 'English'),
(6, 12350, NULL, 'Pulp Fiction', 'A series of interconnected stories involving crime in Los Angeles.', 'R', 8.9, 1994, 'English'),
(7, 12351, 114, 'The Matrix', 'A computer hacker learns that the world he lives in is a simulated reality.', 'R', 8.7, 1999, 'English'),
(8, 12352, NULL, 'Star Wars: A New Hope', 'A young farm boy joins a rebellion to defeat an evil empire.', 'PG', 8.6, 1977, 'English'),
(9, 12353, 115, 'Interstellar', 'Explorers travel through a wormhole to ensure humanitys survival.', 'PG-13', 8.6, 2014, 'English'),
(10, 12354, NULL, 'The Godfather', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', 'R', 9.2, 1972, 'English'),
(11, 12355, 116, 'Gladiator', 'A betrayed Roman general seeks revenge against the corrupt emperor who murdered his family and sent him into slavery.', 'R', 8.5, 2000, 'English'),
(12, 12356, NULL, 'Jurassic Park', 'During a preview tour, a theme park suffers a major power breakdown that allows its cloned dinosaur exhibits to run amok.', 'PG-13', 8.1, 1993, 'English'),
(13, 12357, NULL, 'The Terminator', 'A cyborg assassin is sent from the future to kill the mother of the future leader of the resistance.', 'R', 8.0, 1984, 'English'),
(14, 12358, 117, 'Mad Max: Fury Road', 'In a dystopian wasteland, Max teams up with a mysterious woman to overthrow a brutal warlord.', 'R', 8.1, 2015, 'English'),
(15, 12359, NULL, 'The Wolf of Wall Street', 'The story of a wealthy stockbroker who defrauded investors and was eventually convicted of multiple crimes.', 'R', 8.2, 2013, 'English'),
(16, 12360, NULL, 'The Prestige', 'Two magicians engage in a bitter rivalry, leading to dangerous consequences.', 'PG-13', 8.5, 2006, 'English'),
(17, 12361, 118, 'Shutter Island', 'A U.S. Marshal investigates the disappearance of a patient from a mental hospital.', 'R', 8.1, 2010, 'English'),
(18, 12362, NULL, 'The Revenant', 'A frontiersman struggles to survive after being mauled by a bear and left for dead by members of his own hunting team.', 'R', 8.0, 2015, 'English'),
(19, 12363, NULL, 'Inglourious Basterds', 'A group of Jewish-American soldiers seek revenge on Nazi officials during World War II.', 'R', 8.3, 2009, 'English'),
(20, 12364, 119, 'The Social Network', 'The story of the founding of Facebook and the legal battles that followed.', 'PG-13', 8.0, 2010, 'English'),
(21, 12365, NULL, 'Guardians of the Galaxy', 'A group of intergalactic criminals must pull together to stop a fanatic from taking control of the universe.', 'PG-13', 8.0, 2014, 'English'),
(22, 12366, NULL, 'The Martian', 'An astronaut stranded on Mars must figure out how to survive until rescue.', 'PG-13', 8.0, 2015, 'English'),
(23, 12367, NULL, 'Fight Club', 'An insomniac office worker forms an underground fight club as a form of male bonding.', 'R', 8.8, 1999, 'English'),
(24, 12368, 120, 'Goodfellas', 'The rise and fall of a young man in the Mafia.', 'R', 8.7, 1990, 'English'),
(25, 12369, NULL, 'The Dark Knight Rises', 'Eight years after the events of "The Dark Knight," Batman re-emerges to stop a new foe.', 'PG-13', 8.4, 2012, 'English'),
(26, 12370, 121, 'The Lion King', 'A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.', 'G', 8.5, 1994, 'English'),
(27, 12371, NULL, 'Frozen', 'A young princess sets off on a perilous journey to find her estranged sister, whose icy powers are wreaking havoc on their kingdom.', 'PG', 7.4, 2013, 'English'),
(28, 12372, 122, 'The Pursuit of Happyness', 'A struggling salesman takes custody of his son as he embarks on a life-changing journey.', 'PG-13', 8.0, 2006, 'English'),
(29, 12373, NULL, 'The Godfather: Part II', 'The continuation of the Corleone family saga, focusing on Michael Corleone rise to power and his father early years.', 'R', 9.0, 1974, 'English'),
(30, 12374, NULL, 'The Shawshank Redemption', 'Two imprisoned men bond over several years, finding solace and eventual redemption through acts of common decency.', 'R', 9.3, 1994, 'English'),
(31, 12375, 123, 'Star Wars: The Empire Strikes Back', 'The Rebels face off against the Empire, and Luke Skywalker begins his training with Yoda.', 'PG', 8.7, 1980, 'English'),
(32, 12376, NULL, 'Back to the Future', 'A teenager is accidentally sent 30 years into the past in a time-traveling DeLorean.', 'PG', 8.5, 1985, 'English'),
(33, 12377, 124, 'The Silence of the Lambs', 'A young FBI agent seeks the help of an imprisoned cannibalistic serial killer to catch another killer.', 'R', 8.6, 1991, 'English'),
(34, 12378, NULL, 'Se7en', 'A detective hunts down a serial killer who uses the seven deadly sins as his modus operandi.', 'R', 8.6, 1995, 'English'),
(35, 12379, NULL, 'The Matrix Revolutions', 'Neo must lead the human race in the final battle against the Machines.', 'R', 6.8, 2003, 'English'),
(36, 12380, NULL, 'Blade Runner 2049', 'A young blade runner uncovers a long-buried secret that could change the course of humanity.', 'R', 8.0, 2017, 'English'),
(37, 12381, NULL, 'The Hateful Eight', 'A group of eight strangers with secrets seek refuge from a blizzard, leading to violence and betrayal.', 'R', 7.8, 2015, 'English'),
(38, 12382, 125, 'Jurassic World', 'A new theme park with genetically engineered dinosaurs becomes the site of a deadly escape.', 'PG-13', 7.0, 2015, 'English'),
(39, 12383, NULL, 'The Bourne Identity', 'A man with amnesia embarks on a quest to learn his true identity while being pursued by assassins.', 'PG-13', 7.9, 2002, 'English'),
(40, 12384, NULL, 'The Iron Giant', 'A young boy befriends a giant robot and must protect it from the government.', 'PG', 8.0, 1999, 'English'),
(41, 12385, 126, 'Ocean Eleven', 'A group of thieves plan to rob three Las Vegas casinos at the same time.', 'PG-13', 7.8, 2001, 'English'),
(42, 12386, NULL, 'The Incredibles', 'A family of undercover superheroes tries to live the quiet suburban life, but their superpowers are needed once again.', 'PG', 8.0, 2004, 'English'),
(43, 12387, NULL, 'The Exorcist', 'A mother seeks the help of a priest to rid her daughter of demonic possession.', 'R', 8.0, 1973, 'English'),
(44, 12388, NULL, 'Star Wars: Return of the Jedi', 'The Rebels battle the Empire to end the tyrannical rule of the Galactic Empire.', 'PG', 8.3, 1983, 'English'),
(45, 12389, NULL, 'Pirates of the Caribbean: The Curse of the Black Pearl', 'Captain Jack Sparrow teams up with a blacksmith to find the cursed pirate treasure.', 'PG-13', 8.0, 2003, 'English'),
(46, 12390, NULL, 'The Lion King', 'A young lion prince flees his kingdom only to learn the true meaning of responsibility and bravery.', 'G', 8.5, 1994, 'English'),
(47, 12391, 127, 'Frozen', 'A young princess sets off on a perilous journey to find her estranged sister, whose icy powers are wreaking havoc on their kingdom.', 'PG', 7.4, 2013, 'English'),
(48, 12392, NULL, 'The Pursuit of Happyness', 'A struggling salesman takes custody of his son as he embarks on a life-changing journey.', 'PG-13', 8.0, 2006, 'English'),
(49, 12393, NULL, 'The Godfather: Part II', 'The continuation of the Corleone family saga, focusing on Michael Corleone rise to power and his father early years.', 'R', 9.0, 1974, 'English'),
(50, 12394, NULL, 'The Shawshank Redemption', 'Two imprisoned men bond over several years, finding solace and eventual redemption through acts of common decency.', 'R', 9.3, 1994, 'English');

INSERT INTO "Moviegenre" (movieID, genreID) VALUES
(51, 21), (51, 26), (52, 22), (52, 29), (53, 23),
(53, 27), (54, 21), (54, 24), (55, 26), (55, 28),
(56, 24), (57, 27), (58, 21), (59, 26), (60, 22),
(61, 21), (62, 21), (63, 21), (64, 26), (65, 23),
(66, 27), (67, 22), (68, 21), (69, 22), (70, 29),
(71, 21), (72, 21), (73, 24), (74, 27), (75, 28),
(76, 21), (77, 29), (78, 22), (79, 27), (80, 29),
(81, 21), (82, 23), (83, 26), (84, 21), (85, 24),
(86, 22), (87, 27), (88, 29), (89, 23), (90, 26),
(91, 21), (92, 23), (93, 28), (94, 21), (95, 24),
(96, 29), (97, 21), (98, 27), (99, 22), (100, 23);



INSERT INTO "Movieactor" (movieID, actorID) VALUES
(51, 16), (51, 17), (51, 18), (52, 19), (53, 20),
(54, 16), (55, 21), (56, 17), (57, 18), (58, 19),
(59, 20), (60, 21), (61, 22), (62, 23), (63, 24),
(64, 25), (65, 16), (66, 17), (67, 18), (68, 19),
(69, 20), (70, 21), (71, 22), (72, 23), (73, 24),
(74, 25), (75, 16), (76, 17), (77, 18), (78, 19),
(79, 20), (80, 21), (81, 22), (82, 23), (83, 24),
(84, 25), (85, 16), (86, 17), (87, 18), (88, 19),
(89, 20), (90, 21), (91, 22), (92, 23), (93, 24),
(94, 25), (95, 16), (96, 17), (97, 18), (98, 19),
(99, 20), (100, 21);


INSERT INTO "Movieaka" (movieID, akaID) VALUES
(51, 11), (52, 12), (53, 13), (54, 14), (55, 15),
(56, 16), (57, 17), (58, 18), (59, 19), (60, 20),
(61, 21), (62, 22), (63, 23), (64, 24), (65, 25),
(66, 26), (67, 27), (68, 28), (69, 29), (70, 30),
(71, 31), (72, 32), (73, 33), (74, 34), (75, 35),
(76, 36), (77, 37), (78, 38), (79, 39), (80, 40),
(81, 41), (82, 42), (83, 43), (84, 44), (85, 45),
(86, 46), (87, 47), (88, 48), (89, 49), (90, 50),
(91, 51), (92, 52), (93, 53), (94, 54), (95, 55),
(96, 56), (97, 57), (98, 58), (99, 59), (100, 60);


INSERT INTO "Moviecountry" (movieID, countryCode) VALUES
(51, 'US'), (51, 'UK'), (52, 'US'), (52, 'CA'), (53, 'US'),
(53, 'FR'), (54, 'US'), (55, 'UK'), (56, 'US'), (57, 'US'),
(58, 'AU'), (59, 'DE'), (60, 'US'), (61, 'UK'), (62, 'CA'),
(63, 'AU'), (64, 'US'), (65, 'UK'), (66, 'US'), (67, 'UK'),
(68, 'US'), (69, 'FR'), (70, 'US'), (71, 'DE'), (72, 'FR'),
(73, 'UK'), (74, 'US'), (75, 'US'), (76, 'CA'), (77, 'UK'),
(78, 'US'), (79, 'FR'), (80, 'CA'), (81, 'US'), (82, 'US'),
(83, 'UK'), (84, 'FR'), (85, 'AU'), (86, 'US'), (87, 'US'),
(88, 'CA'), (89, 'UK'), (90, 'US'), (91, 'DE'), (92, 'FR'),
(93, 'US'), (94, 'UK'), (95, 'US');



INSERT INTO "Movielanguage" (movieID, languageID) VALUES
(51, 'EN'), (51, 'CN'), (52, 'EN'), (52, 'ES'), (53, 'EN'),
(53, 'IT'), (54, 'EN'), (55, 'EN'), (56, 'EN'), (57, 'EN'),
(58, 'EN'), (59, 'EN'), (60, 'EN'), (61, 'EN'), (62, 'EN'),
(63, 'EN'), (64, 'EN'), (65, 'EN'), (66, 'EN'), (67, 'EN'),
(68, 'EN'), (69, 'EN'), (70, 'EN'), (71, 'EN'), (72, 'EN'),
(73, 'EN'), (74, 'EN'), (75, 'EN'), (76, 'EN'), (77, 'EN'),
(78, 'EN'), (79, 'EN'), (80, 'EN'), (81, 'EN'), (82, 'EN'),
(83, 'EN'), (84, 'EN'), (85, 'EN'), (86, 'EN'), (87, 'EN'),
(88, 'EN'), (89, 'EN'), (90, 'EN'), (91, 'EN'), (92, 'EN'),
(93, 'EN'), (94, 'EN'), (95, 'EN'), (96, 'EN'), (97, 'EN'),
(98, 'EN'), (99, 'EN'), (100, 'EN');

INSERT INTO "Moviedirector" (movieID, directorID) VALUES
(51, 11), (52, 12), (53, 13), (54, 14), (55, 15),
(56, 16), (57, 17), (58, 18), (59, 19), (60, 20),
(61, 21), (62, 22), (63, 23), (64, 24), (65, 25),
(66, 11), (67, 12), (68, 13), (69, 14), (70, 15),
(71, 16), (72, 17), (73, 18), (74, 19), (75, 20),
(76, 21), (77, 22), (78, 23), (79, 24), (80, 25),
(81, 11), (82, 12), (83, 13), (84, 14), (85, 15),
(86, 16), (87, 17), (88, 18), (89, 19), (90, 20),
(91, 21), (92, 22), (93, 23), (94, 24), (95, 25),
(96, 11), (97, 12), (98, 13), (99, 14), (100, 15);

INSERT INTO "Moviekeyword" (movieID, keywordID) VALUES
(51, 32), (52, 33), (53, 34), (54, 35), (55, 36),
(56, 37), (57, 38), (58, 39), (59, 40), (60, 41),
(61, 42), (62, 43), (63, 44), (64, 45), (65, 46),
(66, 47), (67, 48), (68, 49), (69, 50), (70, 51),
(71, 52), (72, 53), (73, 54), (74, 55), (75, 56),
(76, 57), (77, 58), (78, 59), (79, 60), (80, 61),
(81, 32), (82, 33), (83, 34), (84, 35), (85, 36),
(86, 37), (87, 38), (88, 39), (89, 40), (90, 41),
(91, 42), (92, 43), (93, 44), (94, 45), (95, 46),
(96, 47), (97, 48), (98, 49), (99, 50), (100, 51);
