SELECT COUNT(*) FROM artists;
SELECT COUNT(*) FROM genres;
SELECT COUNT(*) FROM playlists;

SELECT * FROM playlists where Name LIKE 'M%'

SELECT * FROM artists where Name = "LOST"

SELECT * FROM albums where ArtistId = 149;

-- Find all the albums for a given artist
SELECT Name, AlbumId, Title From artists
JOIN albums ON artists.ArtistId = albums.AlbumId
WHERE artists.ArtistId = 17;

-- Find all the songs for a given Genre
SELECT * FROM Genres
JOIN tracks ON Genres.GenreId = tracks.GenreId
WHERE Genres.GenreId = 5;

-- Find all the songs in a playlist - by playlist name...
SELECT * FROM playlists  
JOIN playlist_track ON playlists.playlistId = playlist_track.playlistId
JOIN tracks ON playlist_track.TrackId = tracks.TrackId
WHERE playlists.Name = "Music";

-- 1. Find all the artists for a given Genre
SELECT * FROM genres
SELECT DISTINCT (artists.Name) FROM genres
JOIN tracks ON genres.GenreId = tracks.GenreId
JOIN albums ON tracks.AlbumId = albums.AlbumId
JOIN artists ON albums.ArtistId = artists.ArtistId
WHERE genres.Name = "Rock" 

