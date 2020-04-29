-- Query all of the entries in the Genre table
SELECT * 
FROM Genre

-- Using the INSERT statement, add one of your favorite artists to the Artist table.
INSERT INTO Artist(ArtistName, YearEstablished)
VALUES("Sublime", 1988);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.
INSERT INTO Album(Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES("40 Oz. To Freedom", 1996, 24, "Skunk Records", 28, 9)

-- Using the INSERT statement, add some songs that are on that album to the Song table.
INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Badfish", 184, '01/01/1993', 9, 28, 23)

INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Scarlet Begonias", 162, '01/01/1993', 9, 28, 23)

INSERT INTO Song(Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES("Waiting for My Ruca", 197, '01/01/1993', 9, 28, 23)

-- Write a SELECT query that provides the song titles, album title, 
-- and artist name for all of the data you just entered in. Use the LEFT JOIN keyword 
-- sequence to connect the tables,and the WHERE keyword to filter the results to the 
-- album and artist you added.
SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId 
WHERE a.AlbumId = 23;

-- Write a SELECT statement to display how many songs exist for each album.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(SongId), AlbumId
FROM Song
GROUP BY AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist.
--  You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(SongId), ArtistId
FROM Song
GROUP BY ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT COUNT(SongId), GenreId
FROM Song
GROUP BY GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration.
-- The result should display the album title and the duration.
SELECT Title, MAX(AlbumLength) FROM Album;

-- Using MAX() function, write a select statement to find the song with the longest duration. 
-- The result should display the song title and the duration.
SELECT Title, MAX(SongLength) FROM Song;

-- Modify the previous query to also display the title of the album.
SELECT Album.Title AS AlbumTitle, Song.Title AS SongTitle, MAX(SongLength) FROM Song LEFT JOIN Album
ON Song.AlbumId = Album.AlbumId
;



