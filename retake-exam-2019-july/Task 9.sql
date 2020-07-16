select concat(substring(c.comment,1,20), '...') as summary
from comments as c
left join likes as l
on c.id = l.comment_id
where l.id is null
order by c.id desc;