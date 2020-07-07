insert into likes(article_id, comment_id,user_id)
select if(u.id%2 = 0, char_length(u.username),null) ,
	   if(u.id%2 = 1, char_length(u.email),null),
		u.id
from users as u
where u.id between 16 and 20;