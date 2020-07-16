select a.title, count(c.id) as comments
from comments as c
join articles as a
on c.article_id = a.id
where a.category_id = 5
group by a.title
order by comments desc
limit 1; 