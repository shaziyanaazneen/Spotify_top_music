Select * from spotifytopmusic;

--Estimating top genres according to popularity:

SELECT genres, SUM(popularity) AS total_popularity
FROM spotifytopmusic
GROUP BY genres
ORDER BY total_popularity DESC;

--FINDING THE TOP TRACK:

select track_name, sum(popularity) as total_popularity from spotifytopmusic
group by track_name
order by total_popularity desc;

--FINDING THE ARTIST OF TOP TRACK:

select artist_name, track_name, sum(popularity) as total_popularity from spotifytopmusic
group by artist_name, track_name
order by total_popularity desc;

--converting duration in milliseconds to duration in minutes
SELECT duration_ms / (1000 * 60) AS duration_minutes
FROM spotifytopmusic;


--FINDING THE TRACK WHICH HAS MORE DURATION

select track_name, duration_ms from spotifytopmusic
group by track_name, duration_ms
order by duration_ms desc;

--FINDING THE TRACK WHICH HAS MORE LIVENESS

select track_name, liveness from spotifytopmusic
group by track_name, liveness
order by liveness desc;

--WHICH TRACK&GENRE HAVE HIGHER PERCEIVED LOUDNESS

SELECT track_name, genres, AVG(loudness) AS avg_loudness
FROM spotifytopmusic
GROUP BY track_name, genres
ORDER BY avg_loudness DESC;

--DETERMINING THE RELEASE DATE OF TOP TRACK

select track_name, album_release_date, popularity from spotifytopmusic
group by track_name, album_release_date, popularity
order by popularity desc;

--ESTIMATING THE TRACK&GENRE WHICH IS DANCEABILITY

SELECT track_name, genres, danceability FROM spotifytopmusic
WHERE danceability = (
        SELECT MAX(danceability) --Query inside a query is known as subquery
        FROM spotifytopmusic
    );

--FINDING THE TRACK, GENRE WHICH HAS MORE ENERGY

SELECT track_name, genres, energy
FROM spotifytopmusic
WHERE 
    energy = (
        SELECT MAX(energy) FROM spotifytopmusic
    );

--finding the data which have max acousticness

select * from spotifytopmusic
where acousticness = (
                    select MAX(acousticness) from spotifytopmusic
		);

--finding the data which have more instrumentalness

select * from spotifytopmusic
where instrumentalness = (
                    select MAX(instrumentalness) from spotifytopmusic
		);


select * from spotifytopmusic;