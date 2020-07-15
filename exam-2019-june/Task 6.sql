select id, concat(first_name, ' ', last_name) as full_name,
           concat('$', salary) as salary, 
	   started_on
from employees
where salary >= 100000 and year(started_on) >= 2018
order by salary desc, id;