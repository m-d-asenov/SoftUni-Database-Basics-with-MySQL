select a.id, a.title
from articles as a
right join users_articles as ua
on a.id = ua.article_id
where a.id = ua.user_id
order by a.id;