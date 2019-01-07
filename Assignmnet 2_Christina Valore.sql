/*Christina Valore
Winter Bridge 2018
12/23/18*/

/*Link to GitHub project: https://github.com/ChristinaValore/week-1-assignment */

/*
1. Videos table. Create one table to keep track of the videos. This table should include a unique ID, 
the title of the video, the length in minutes and the URL. Populate the table with at least 
three related videos from YouTube or other publicly available resources.
*/

DROP TABLE IF EXISTS tblvideos;
 
CREATE TABLE tblvideos
(
  video_id int PRIMARY KEY,
  title varchar(80) NOT NULL,
  length varchar(100) NOT NULL,
  url varchar(100) NOT NULL
);

INSERT INTO tblvideos (video_id, title, length, url) VALUES (1, 'Colts vs. Texans Wild Card Round Highlights | NFL 2018 Playoffs','12:35','https://www.youtube.com/watch?v=YU2biPnVCv0');
INSERT INTO tblvideos (video_id, title, length, url) VALUES (2, 'DRIVING WITH ABBY LEE!!!','7:58','https://www.youtube.com/watch?v=oJNhCO8IrMs');
INSERT INTO tblvideos (video_id, title, length, url) VALUES (3, 'Ozuna- BAILA BAILA BAILA (Video Oficial)','3:27','https://www.youtube.com/watch?v=32F2d-wj4Xw');

SELECT * FROM tblvideos;

/*
2. Create and populate Reviewers table.Create a second table that provides at least two user reviews for 
each of at least two of the videos. These should be imaginary reviews that include columns for the user’s name 
(“Asher ”, “Cyd”, etc.), the rating (which could be NULL, or a number between 0 and 5), and a short text review 
(“Loved it!”). There should be a column that links back to the ID column in the table of videos.
*/

DROP TABLE IF EXISTS tblreviews;
 
CREATE TABLE tblreviews
(
  review_id int PRIMARY KEY,
  video_id int NOT NULL REFERENCES tblvideos,
  user varchar(30) NOT NULL,
  rating int,
  reviews varchar(100) NOT NULL
);

INSERT INTO tblreviews (review_id, video_id, user, rating, reviews) VALUES (1, 1, 'John', 4,'Go Colts!');
INSERT INTO tblreviews (review_id, video_id, user, rating, reviews) VALUES (2, 1, 'Anthony', 5,'This was a great game!');
INSERT INTO tblreviews (review_id, video_id, user, rating, reviews) VALUES (5, 2, 'Jane', 2,'The video was not good.');
INSERT INTO tblreviews (review_id, video_id, user, rating, reviews) VALUES (6, 2, 'Maria', 1,'This was not funny.');
INSERT INTO tblreviews (review_id, video_id, user, rating, reviews) VALUES (3, 3, 'Danielle', 5,'Great song!');
INSERT INTO tblreviews (review_id, video_id, user, rating, reviews) VALUES (4, 3, 'Christina', NULL,'Not a big fan of Ozuna.');

SELECT * FROM tblreviews;

/*
3. Report on Video Reviews. Write a JOIN statement that shows information from both tables.
*/
SELECT 
vid.video_id AS 'Video ID',
vid.title AS 'Title',
vid.length AS 'Length',
vid.url AS 'URL',
rev.user As 'User',
rev.rating As 'Rating',
rev.reviews AS 'Review'
FROM tblvideos AS vid
JOIN tblreviews AS rev
ON vid.video_id = rev.video_id;
