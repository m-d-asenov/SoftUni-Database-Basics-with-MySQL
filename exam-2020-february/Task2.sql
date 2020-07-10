use fsd;

insert into coaches(first_name, last_name, salary, coach_level)
select p.first_name, p.last_name, p.salary*2,char_length(p.first_name)
from players as p
where p.age >= 45;