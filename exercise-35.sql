select (
    select name from Users
where user_id in (
    select user_id from (
    select user_id,count(movie_id) as count from MovieRating
group by user_id
) as sub
where count = (select max(count) from(
    select user_id,count(movie_id) as count from MovieRating
group by user_id
)as sub)
)
order by name
limit 1
) as results
union all
select (
    select title from Movies
where movie_id in (
    select movie_id from (
    select movie_id,avg(rating) as rating_avg
from MovieRating
where created_at between "2020-02-01" and "2020-02-29"
group by movie_id
) as sub
where rating_avg = (select max(rating_avg) from (
    select movie_id,avg(rating) as rating_avg
from MovieRating
where created_at between "2020-02-01" and "2020-02-29"
group by movie_id
) as sub)
)
order by title
limit 1
) as results

-- second query that does the same thing
select (select u.name from Users u
join MovieRating m on u.user_id = m.user_id
group by m.user_id
order by count(movie_id) desc,u.name 
limit 1) as results

union all
select (
    select m.title as results from Movies m
join MovieRating r on m.movie_id = r.movie_id
where created_at between "2020-02-01" and "2020-02-29"
group by m.movie_id
order by avg(rating) desc, m.title
limit 1

) as results
