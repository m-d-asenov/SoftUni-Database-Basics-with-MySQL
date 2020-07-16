select emb.title, emb.summary
from (select id, title, concat( substring(content,1,20), '...' ) as summary
	from articles
	order by char_length(content) desc
	limit 3) as emb
order by emb.id;