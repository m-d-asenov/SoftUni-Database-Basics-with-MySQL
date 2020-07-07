update comments as c
set c.comment = case
		  when id % 2 = 0 then 'Very good article.'
                  when id % 3 = 0 then 'This is interesting.'
		  when id % 5 = 0 then 'I definitely will read the article again.' 
		  when id % 7 = 0 then 'The universe is such an amazing thing.'
                  else c.comment
	        end
where c.id between 1 and 15;