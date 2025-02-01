# Stack Overflow Post Analysis: A SQL Portfolio Project

## Overview

This project involves the analysis of Stack Overflow posts using SQL. It includes the creation of a database with several interconnected tables that represent user activities, post history, badges, comments, votes, and tags associated with posts. The goal is to use SQL queries to explore various aspects of the data, perform filtering, aggregation, and join operations, and uncover insights related to user contributions and post interactions.

## Database Setup

### 1. Database Creation

```sql
CREATE DATABASE project;
USE project;
```

### 2. Tables and Data

This project contains the following tables, each holding relevant data for analysis:

- `badges`: Tracks badges earned by users.
- `comments`: Stores comments made by users on posts.
- `post_history`: Contains the history of changes made to posts.
- `post_links`: Represents relationships between posts (related posts).
- `posts`: Contains the posts, including their titles, scores, and view counts.
- `posts_answers`: Stores answers to posts with score and view count data.
- `tags`: Lists the tags associated with posts.
- `users`: Holds user details, including their reputation and display name.
- `votes`: Stores votes cast on posts.
  
### 3. Data Insertion

Data has been inserted into each table to simulate a Stack Overflow-like environment. Examples include user badges, post comments, post histories, and more.

## SQL Queries

### Part 1: Basics

#### 1. Loading and Exploring Data

Exploring the structure and content of the tables:

```sql
SELECT * FROM badges LIMIT 10;
SELECT * FROM comments LIMIT 10;
SELECT * FROM post_history LIMIT 10;
SELECT * FROM posts LIMIT 10;
```

#### 2. Filtering and Sorting

```sql
-- Find all posts with a view_count greater than 100
SELECT * FROM posts WHERE view_count > 100;

-- Display comments made in 2005, sorted by creation_date
SELECT * FROM comments WHERE Year(creation_date) = 2005 ORDER BY creation_date;
```

#### 3. Simple Aggregations

```sql
-- Count the total number of badges
SELECT count(*) AS total_badges FROM badges;

-- Calculate the average score of posts grouped by post_type_id
SELECT post_type_id, avg(score) AS avg_score FROM posts_answers GROUP BY post_type_id;
```

### Part 2: Joins

#### 1. Basic Joins

```sql
-- Combine post_history and posts to display the title of posts and changes made
SELECT p.title, ph.text, ph.creation_date
FROM post_history ph
JOIN posts p ON ph.post_id = p.id
ORDER BY ph.creation_date;
```

#### 2. Multi-Table Joins

```sql
-- Fetch post titles, comments, and users who made those comments
SELECT p.title AS posts, c.text AS comments, u.display_name AS users
FROM posts p
JOIN comments c ON p.id = c.post_id
JOIN users u ON c.user_id = u.id;
```

### Part 3: Subqueries

#### 1. Single-Row Subqueries

```sql
-- Find the user with the highest reputation
SELECT display_name, reputation FROM users WHERE reputation = (SELECT max(reputation) FROM users);
```

#### 2. Correlated Subqueries

```sql
-- For each post, fetch the number of related posts
SELECT p1.id, p1.title, (SELECT count(*) FROM post_links pl WHERE p1.id = pl.post_id) AS related_posts_count
FROM posts p1;
```

### Part 4: Common Table Expressions (CTEs)

#### 1. Non-Recursive CTE

```sql
WITH UserAverageScores AS (
    SELECT owner_user_id, AVG(score) AS avg_score FROM posts_answers GROUP BY owner_user_id
)
SELECT * FROM UserAverageScores;
```

#### 2. Recursive CTE

```sql
WITH RECURSIVE PostHierarchy AS (
    SELECT post_id, related_post_id, 1 AS level
    FROM post_links
    WHERE post_id = 2001

    UNION ALL

    SELECT pl.post_id, pl.related_post_id, ph.level + 1
    FROM post_links pl
    INNER JOIN PostHierarchy ph ON pl.related_post_id = ph.post_id
    WHERE ph.level < 30
)
SELECT * FROM PostHierarchy;
```

### Part 5: Advanced Queries

#### 1. Window Functions

```sql
-- Rank posts based on their score within each year
SELECT id, score, creation_date, YEAR(creation_date) AS post_year,
       RANK() OVER (PARTITION BY YEAR(creation_date) ORDER BY score DESC) AS rank_within_year
FROM posts
ORDER BY post_year, rank_within_year;
```

#### 2. Running Totals

```sql
-- Calculate the running total of badges earned by users
SELECT user_id, name AS user_name, date AS earned_date,
       SUM(1) OVER (PARTITION BY user_id ORDER BY date) AS total_running_badges
FROM badges;
```

## New Insights and Questions

This section provides insights into user activities, badge earning trends, and relationships between posts, comments, and tags. The following queries explore various aspects of Stack Overflow user engagement and post interactions:

### a) **Which users have contributed the most in terms of comments, edits, and votes?**

We analyzed the number of comments made by users in the **comments** table. This query gives an overview of user involvement in terms of comments, showing which users are more engaged.

```sql
SELECT 
    user_id, 
    COUNT(text) AS total_comments
FROM comments
GROUP BY user_id;
```

This can help identify users who actively participate by commenting and providing insights into user-driven content.

### b) **What types of badges are most commonly earned, and which users are the top earners?**

Two queries were created to answer this question. The first query focuses on finding the users who earned the most badges. The second one highlights which badges were earned the most.

#### Option # 1: **Top Badge Earners**

This query joins the **badges** and **users** tables to find the users who have earned the most badges:

```sql
SELECT 
    b.user_id, 
    u.display_name, 
    COUNT(*) AS total_badges
FROM badges b
JOIN users u ON b.user_id = u.id
GROUP BY b.user_id, u.display_name
ORDER BY total_badges DESC
LIMIT 5;
```

This will help identify the top users with the highest badge counts.

#### Option # 2: **Most Commonly Earned Badges**

The second query looks at which badges are the most frequently earned across all users:

```sql
SELECT 
    name AS badge_name, 
    COUNT(*) AS total_earned
FROM badges
GROUP BY name
ORDER BY total_earned DESC
LIMIT 5;
```

This will reveal trends in badge earning, providing insights into the types of badges that are awarded most frequently (e.g., "Gold Contributor", "Bronze Reviewer").

### c) **Which tags are associated with the highest-scoring posts?**

There is no direct relationship between the **tags** and **posts** tables in the current schema, making it difficult to query tags based on the highest-scoring posts directly. In cases where such data exists, a join can be made between posts and tags using an intermediary table, but the given dataset does not support that directly.

### d) **How often are related questions linked, and what does this say about knowledge sharing?**

By analyzing the **post_links** table, we can observe how often posts (questions) are linked to each other. This query helps determine how frequently users find related posts, reflecting the way knowledge is shared and interlinked in the Stack Overflow community:

```sql
SELECT 
    p.id,
    p.title, 
    COUNT(pl.id) AS linked_counts
FROM post_links pl
JOIN posts p ON pl.post_id = p.id
GROUP BY p.title
ORDER BY linked_counts;
```

## Conclusion

This project demonstrates how SQL can be used to analyze data in a relational database. By utilizing techniques such as filtering, aggregation, joins, subqueries, common table expressions, and window functions, we can gain valuable insights into the data and better understand the dynamics of user interactions and content creation.

## Installation

To set up this project:

1. Clone the repository.
2. Set up a MySQL database.
3. Run the provided SQL scripts to create tables and insert data.
4. Execute the queries to explore and analyze the data.
