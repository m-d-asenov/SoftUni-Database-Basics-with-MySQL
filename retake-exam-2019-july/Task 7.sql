select c.category, count(distinct a.id) as articles, count(l.id) as likes
from categories as c
left join articles as a
on c.id = a.category_id
left join likes as l
on a.id = l.article_id
group by c.category
order by likes desc, articles desc, c.id;