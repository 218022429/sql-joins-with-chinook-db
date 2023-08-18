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

-- 2. Find the Playlist with the most / least songs (will need a group by  and count )

SELECT playlists.Name,
  count(*) AS SongCount
FROM playlists
JOIN playlist_track on playlist_track.PlaylistId = playlists.PlaylistId
GROUP BY playlist.Name
ORDER BY SongCount DESC
LIMIT 1;

SELECT playlists.Name,
  count(*) AS SongCount
FROM playlists
JOIN playlist_track on playlist_track.PlaylistId = playlists.PlaylistId
GROUP BY playlist.Name
ORDER BY SongCount ASC
LIMIT 1;

-- 3. Find the total for a given invoice (will need a sum)
SELECT invoices.InvoiceId AS Invoice_ID,
'R' || invoices.Total AS Total 
FROM invoices 
WHERE invoices.InvoiceId = 1;

-- 4. Find all the playlists containing a given genre 
-- SELECT * FROM genres
SELECT DISTINCT (playlists.Name) FROM genres
JOIN playlists ON playlist_track.PlaylistId = playlists.PlaylistId
JOIN playlist_track ON tracks.TrackId = playlist_track.TrackId
JOIN tracks ON genres.GenreId = tracks.GenreId
WHERE genres.Name = "Rock" 

-- 5. Find the biggest/smallest invoice amounts (needs group by)
SELECT InvoiceId, Min(Total) FROM invoices;
SELECT InvoiceId, Max(Total) FROM invoices;

-- 6. Find the artist with the most/least songs (needs group by) 
SELECT artists.Name, count(*) AS TrackCount
FROM artists
JOIN albums ON albums.ArtistId = artists.ArtistId
JOIN tracks ON tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY TrackCount DESC
LIMIT 5
