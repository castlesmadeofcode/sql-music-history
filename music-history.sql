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
-- sequence to connect the tables,and the WHERE keyword to filter the results to the album and artist you added.
SELECT a.Title, s.Title, ar.ArtistName
FROM Song s
LEFT JOIN Album a ON s.AlbumId = a.AlbumId 
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId
WHERE a.AlbumId = 23;

-- Write a SELECT statement to display how many songs exist for each album.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT a.Title AS AlbumTitle, COUNT(s.SongId)
FROM Song AS s
LEFT JOIN Album AS a ON s.AlbumId = a.AlbumId
GROUP BY s.AlbumId;

-- Write a SELECT statement to display how many songs exist for each artist.
--  You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT ar.ArtistName, COUNT(s.SongId)
FROM Song s
LEFT JOIN Artist ar ON s.ArtistId = ar.ArtistId
GROUP BY s.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre.
-- You'll need to use the COUNT() function and the GROUP BY keyword sequence.
SELECT g.Label, COUNT(s.SongId) AS 'Song Count'
FROM Song s
LEFT JOIN Genre g ON s.GenreId = g.GenreId
GROUP BY s.GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration.
-- The result should display the album title and the duration.
SELECT Title AS 'AlbumTitle', MAX(AlbumLength) 
FROM Album;

-- Using MAX() function, write a select statement to find the song with the longest duration. 
-- The result should display the song title and the duration.
SELECT Title AS 'SongTitle', MAX(SongLength) 
FROM Song;

-- Modify the previous query to also display the title of the album.
SELECT Album.Title AS 'AlbumTitle', Song.Title AS 'SongTitle', MAX(SongLength) 
FROM Song 
LEFT JOIN Album ON Song.AlbumId = Album.AlbumId;



