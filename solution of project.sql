-- Project Title 

-- "Stack Overflow Post Analysis: A SQL Portfolio Project"

-- Creation of database with name "project" 

Create database project;

-- Using "project" database 

USE project;

-- Creation of Tables and Insertion of Table Data. 
 
CREATE TABLE badges (
    id INT PRIMARY KEY,
    user_id INT,
    name VARCHAR(255),
    date DATE
);


INSERT INTO badges (id, user_id, name, date) VALUES
(1, 1001, 'Gold Contributor', '2024-01-01'),
(2, 1002, 'Silver Helper', '2024-01-05'),
(3, 1003, 'Bronze Reviewer', '2024-02-10'),
(4, 1001, 'Silver Helper', '2024-03-15'),
(5, 1004, 'Gold Contributor', '2024-04-20'),
(6, 1001, 'Gold Contributor', '2024-05-05'),
(7, 1002, 'Bronze Reviewer', '2024-06-10'),
(8, 1003, 'Silver Helper', '2024-07-10'),
(9, 1004, 'Gold Contributor', '2024-08-01'),
(10, 1001, 'Bronze Reviewer', '2024-09-01');


CREATE TABLE comments (
    id INT PRIMARY KEY,
    post_id INT,
    user_id INT,
    creation_date DATE,
    text TEXT
);

INSERT INTO comments (id, post_id, user_id, creation_date, text) VALUES
(1, 2001, 1001, '2024-01-01', 'Great explanation!'),
(2, 2002, 1002, '2024-01-05', 'This helped a lot.'),
(3, 2003, 1003, '2024-01-10', 'Can you clarify?'),
(4, 2004, 1001, '2024-01-15', 'Excellent resource.'),
(5, 2005, 1004, '2024-01-20', 'Thank you for sharing.'),
(6, 2001, 1002, '2024-01-25', 'I agree, very useful.'),
(7, 2003, 1003, '2024-02-01', 'This solved my issue.'),
(8, 2004, 1001, '2024-02-05', 'Thanks for the info.'),
(9, 2005, 1004, '2024-02-10', 'Could use more detail.'),
(10, 2006, 1002, '2024-02-15', 'Good job on this one!');


CREATE TABLE post_history (
    id INT PRIMARY KEY,
    post_history_type_id INT,
    post_id INT,
    user_id INT,
    text TEXT,
    creation_date DATE
);

INSERT INTO post_history (id, post_history_type_id, post_id, user_id, text, creation_date) VALUES
(1, 1, 2001, 1001, 'Initial post creation', '2024-01-01'),
(2, 2, 2002, 1002, 'Edited post for clarity', '2024-01-05'),
(3, 3, 2003, 1003, 'Comment added by moderator', '2024-01-10'),
(4, 1, 2004, 1001, 'First version of the post', '2024-01-15'),
(5, 2, 2005, 1004, 'Reworded answer', '2024-01-20'),
(6, 3, 2001, 1002, 'User updated answer with additional info', '2024-01-25'),
(7, 1, 2003, 1003, 'Post originally created', '2024-02-01'),
(8, 3, 2004, 1001, 'Moderators edited content', '2024-02-05'),
(9, 2, 2005, 1004, 'User revised explanation', '2024-02-10'),
(10, 3, 2006, 1002, 'Moderators flagged inappropriate content', '2024-02-15');


CREATE TABLE post_links (
    id INT PRIMARY KEY,
    post_id INT,
    related_post_id INT,
    link_type_id INT
);

INSERT INTO post_links (id, post_id, related_post_id, link_type_id) VALUES
(1, 2001, 2002, 1),
(2, 2002, 2003, 2),
(3, 2003, 2004, 1),
(4, 2004, 2005, 3),
(5, 2005, 2006, 2),
(6, 2001, 2004, 3),
(7, 2002, 2006, 1),
(8, 2003, 2005, 2),
(9, 2004, 2006, 3),
(10, 2005, 2001, 2);


CREATE TABLE posts_answers (
    id INT PRIMARY KEY,
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts_answers (id, post_type_id, creation_date, score, view_count, owner_user_id) VALUES
(1, 1, '2024-01-01', 10, 100, 1001),
(2, 2, '2024-01-05', 20, 150, 1002),
(3, 1, '2024-01-10', 5, 50, 1003),
(4, 2, '2024-01-15', 15, 120, 1001),
(5, 1, '2024-01-20', 30, 200, 1004),
(6, 2, '2024-01-25', 25, 180, 1002),
(7, 1, '2024-02-01', 40, 300, 1003),
(8, 2, '2024-02-05', 10, 80, 1001),
(9, 1, '2024-02-10', 8, 90, 1004),
(10, 2, '2024-02-15', 50, 400, 1002);

CREATE TABLE tags (
    id INT PRIMARY KEY,
    tag_name VARCHAR(255)
);

INSERT INTO tags (id, tag_name) VALUES
(1, 'SQL'),
(2, 'JavaScript'),
(3, 'React'),
(4, 'Python'),
(5, 'AI'),
(6, 'Machine Learning'),
(7, 'Node.js'),
(8, 'CSS'),
(9, 'HTML'),
(10, 'Database');


CREATE TABLE users (
    id INT PRIMARY KEY,
    display_name VARCHAR(255),
    reputation INT,
    creation_date DATE
);

INSERT INTO users (id, display_name, reputation, creation_date) VALUES
(1001, 'Alice', 1500, '2024-01-01'),
(1002, 'Bob', 1200, '2024-01-05'),
(1003, 'Charlie', 800, '2024-01-10'),
(1004, 'Dave', 1800, '2024-01-15'),
(1005, 'Eve', 1000, '2024-01-20'),
(1006, 'Frank', 2000, '2024-01-25'),
(1007, 'Grace', 1300, '2024-02-01'),
(1008, 'Hank', 1100, '2024-02-05'),
(1009, 'Ivy', 900, '2024-02-10'),
(1010, 'Jack', 1600, '2024-02-15');


CREATE TABLE votes (
    id INT PRIMARY KEY,
    post_id INT,
    vote_type_id INT,
    creation_date DATE
);

INSERT INTO votes (id, post_id, vote_type_id, creation_date) VALUES
(1, 2001, 1, '2024-01-01'),
(2, 2002, 2, '2024-01-05'),
(3, 2003, 1, '2024-01-10'),
(4, 2004, 2, '2024-01-15'),
(5, 2005, 1, '2024-01-20'),
(6, 2001, 2, '2024-01-25'),
(7, 2003, 1, '2024-02-01'),
(8, 2004, 2, '2024-02-05'),
(9, 2005, 1, '2024-02-10'),
(10, 2006, 2, '2024-02-15');


CREATE TABLE posts (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    post_type_id INT,
    creation_date DATE,
    score INT,
    view_count INT,
    owner_user_id INT
);

INSERT INTO posts (id, title, post_type_id, creation_date, score, view_count, owner_user_id)
VALUES
(2001, 'How to solve SQL JOIN issues?', 1, '2023-01-01', 10, 100, 1),
(2002, 'Best practices for writing SQL queries', 2, '2023-01-02', 15, 150, 2),
(2003, 'Understanding INNER JOIN in SQL', 1, '2023-01-03', 20, 200, 3),
(2004, 'What is a LEFT JOIN?', 2, '2023-01-04', 25, 250, 4),
(2005, 'Database indexing techniques', 1, '2023-01-05', 30, 300, 5),
(2006, 'Explaining SQL subqueries', 2, '2023-01-06', 35, 350, 6),
(2007, 'How to optimize SQL queries?', 1, '2023-01-07', 40, 400, 7),
(2008, 'Database normalization concepts', 2, '2023-01-08', 45, 450, 8),
(2009, 'SQL Aggregate Functions explained', 1, '2023-01-09', 50, 500, 9),
(2010, 'Introduction to SQL Window Functions', 2, '2023-01-10', 55, 550, 10);

-- select all the tables 
select * from badges;
select * from comments;
select * from post_history;
select * from post_links;
select * from posts;
select * from posts_answers;
select * from tags;
select * from users;
select * from votes;

--- Part 1: Basics
--- 1. Loading and Exploring Data

-- a) Explore the structure and first 10 rows of each table. 

SELECT * FROM badges LIMIT 10;
select * from comments LIMIT 10;
select * from post_history LIMIT 10; 
select * from post_links LIMIT 10;
select * from posts LIMIT 10;
select * from posts_answers LIMIT 10;
select * from tags LIMIT 10;
select * from users LIMIT 10;
select * from votes LIMIT 10;


-- b) Identify the total number of records in each table. 

SELECT COUNT(*) AS total_records_of_badges FROM badges;
select COUNT(*) AS total_records_of_comments FROM comments;
select COUNT(*) AS total_records_of_post_history FROM post_history; 
select COUNT(*) AS total_records_of_post_links FROM post_links;
select COUNT(*) AS total_records_of_posts FROM posts;
select COUNT(*) AS total_records_of_posts_answers FROM posts_answers;
select COUNT(*) AS total_records_of_tags FROM tags;
select COUNT(*) AS total_records_of_users FROM users;
select COUNT(*) AS total_records_of_votes FROM votes; 

--- 2. Filtering and Sorting

-- a) Find all posts with a view_count greater than 100

select * 
from posts
where view_count >100;
 
-- b) Display comments made in 2005, sorted by creation_date (comments table).  

select * 
from comments
where Year(creation_date) = 2005
order by creation_date;

--- 3. Simple Aggregations
 
-- a) Count the total number of badges (badges table). 

select count(*) as total_badges
from badges;

-- b) Calculate the average score of posts grouped by post_type_id (posts_answer table). 

select avg(score)
from posts_answers
group by post_type_id;


select post_type_id,
		avg(score) as avg_score 
from posts_answers
group by post_type_id;


--Part 2: Joins

-- 1. Basic Joins

-- a) Combine the post_history and posts tables to display the title of posts and the corresponding changes made in the post history.  

SELECT p.title, ph.text, ph.creation_date
FROM post_history ph
JOIN posts p ON ph.post_id = p.id
ORDER BY ph.creation_date;

-- b) Join the users table with badges to find the total badges earned by each user.  

select u.display_name, count(b.id) as total_badges
from users u
join badges b on u.id = b.user_id
group by u.id;

-- 2. Multi-Table Joins

-- a) Fetch the titles of posts (posts), their comments (comments), and the users who made those comments (users). 

SELECT p.title AS posts, 
       c.text as comments, 
       u.display_name AS users
FROM posts p
JOIN comments c ON p.id = c.post_id
JOIN users u ON c.user_id = u.id;

-- b) Combine post_links with posts to list related questions. 
 
SELECT p1.title AS question_title, 
       p2.title AS related_question_title
FROM posts p1
INNER JOIN post_links pl ON p1.id = pl.post_id
INNER JOIN posts p2 ON pl.related_post_id = p2.id;

-- c) Join the users, badges, and comments tables to find the users who have earned badges and made comments. 

select u.display_name as user_name,
		b.name as badge_name,
        c.text as comments
from users u
JOIN comments c ON u.id = c.user_id  
JOIN badges b ON u.id = b.user_id;


-- Part 3: Subqueries

-- 1. Single-Row Subqueries 

-- a) Find the user with the highest reputation (users table).

select display_name,reputation
from users 
where reputation =(select max(reputation)from users);

-- b) Retrieve posts with the highest score in each post_type_id (posts table). 

select title, score, post_type_id
from posts p1
where score = (select max(score) from posts p2
where p1.post_type_id = p2.post_type_id);


-- 2. Correlated Subqueries 

-- a) For each post, fetch the number of related posts from post_links.
	select 
	p1.id,p1.title,
    (select 
    count(*) 
    from post_links pl
    where p1.id = pl.post_id) As related_posts_count
    from posts p1;
    
    
-- Part 4: Common Table Expressions (CTEs)

-- 1. Non-Recursive CTE

-- Create a CTE to calculate the average score of posts by each user and use it to:    
    
-- Step # 1 (posts_answers)
WITH UserAverageScores AS (
    SELECT 
        owner_user_id,
        AVG(score) AS avg_score
    FROM posts_answers
    GROUP BY owner_user_id
)
SELECT * FROM UserAverageScores;

-- Step # 2 (Modify the Filter for (avg_score))
 
 WITH UserAverageScores AS (
    SELECT 
        owner_user_id,
        AVG(score) AS avg_score
    FROM posts_answers
    GROUP BY owner_user_id
)
SELECT 
    u.id AS user_id,
    u.display_name,
    uas.avg_score,
    RANK() OVER (ORDER BY uas.avg_score DESC) AS `rank`
FROM UserAverageScores uas
JOIN users u ON uas.owner_user_id = u.id
WHERE uas.avg_score > 0;  -- filter karke dekheingy avg_score zero se bara ha na


 -- Step # 3 (average score of posts by each user)

WITH UserAverageScores AS (
    SELECT 
        owner_user_id,
        AVG(score) AS avg_score
    FROM posts_answers
    WHERE score IS NOT NULL   -- ismein dekheingy koi null toh nhn hai.
    GROUP BY owner_user_id
)
SELECT 
    u.id AS user_id,
    u.display_name,
    uas.avg_score,
    RANK() OVER (ORDER BY uas.avg_score DESC) AS `rank`
FROM UserAverageScores uas
JOIN users u ON uas.owner_user_id = u.id
WHERE uas.avg_score > 50;

-- 2. Recursive CTE
-- Simulate a hierarchy of linked posts using the post_links table. 

 WITH RECURSIVE PostHierarchy AS (
     SELECT post_id, related_post_id, 1 AS level
     FROM post_links
     WHERE post_id = 2001  

     UNION ALL

     SELECT pl.post_id, pl.related_post_id, ph.level + 1
     FROM post_links pl
     INNER JOIN PostHierarchy ph ON pl.related_post_id = ph.post_id
     WHERE ph.level < 30  -- yahan par condition recursion limit ko control karegi
 )
 SELECT * FROM PostHierarchy;


-- Part 5: Advanced Queries

-- 1. Window Functions
-- a) Rank posts based on their score within each year (posts table).

select * from posts;
SELECT 
    id,
    score,
    creation_date,
    YEAR(creation_date) AS post_year,  
    RANK() OVER (PARTITION BY YEAR(creation_date) 
    ORDER BY score DESC) AS rank_within_year
FROM posts
ORDER BY post_year, rank_within_year;

-- b) Calculate the running total of badges earned by users (badges table).

select * from badges;
select user_id as userid, name as user_name, date as earned_date,
Sum(1) over (partition by user_id order by date) as total_running_badges
from badges;


-- New Insights and Questions

-- a) Which users have contributed the most in terms of comments, edits, and votes?

SELECT 
    user_id, 
    COUNT(text) AS total_comments
FROM comments
GROUP BY user_id;

-- b) What types of badges are most commonly earned, and which users are the top earners?

Option # 1:

SELECT 
    b.user_id, 
    u.display_name, 
    COUNT(*) AS total_badges
FROM badges b
JOIN users u ON b.user_id = u.id
GROUP BY b.user_id, u.display_name
ORDER BY total_badges DESC
LIMIT 5;


Option # 2:

SELECT 
    name AS badge_name, 
    COUNT(*) AS total_earned
FROM badges
GROUP BY name
ORDER BY total_earned DESC
LIMIT 5;

-- c) Which tags are associated with the highest-scoring posts?

There is no direct link between the **tags** and **posts** tables because neither table contains the primary key of the other as a foreign key. 
Since there are no common values between them, we cannot use a JOIN to connect them. 
Therefore, the query does not match the given dataset correctly.

-- d) How often are related questions linked, and what does this say about knowledge sharing?

SELECT 
	p.id,
    p.title, 
    COUNT(pl.id) AS linked_counts
FROM post_links pl
JOIN posts p ON pl.post_id = p.id
GROUP BY p.title
ORDER BY linked_counts;

-- END OF THE PROJECT