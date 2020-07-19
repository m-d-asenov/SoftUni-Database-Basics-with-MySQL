-- Task 5
select username, age
from users
order by age, username desc;


-- Task 6
select description, open_date
from reports
where employee_id is null
order by open_date, description;



-- Task 7
select e.first_name, e.last_name, r.description, 
		date_format(r.open_date, '%Y-%m-%d') as open_date
from reports as r 
join employees as e
on r.employee_id = e.id
order by e.id, r.open_date, r.id;



-- Task 8
select c.name as category_name, count(r.id) as reports_number
from reports as r 
right join categories as c
on r.category_id = c.id
group by c.id
order by reports_number, category_name;



-- Task 9
select c.name as category_name, count(r.employee_id) as employees_number
from reports as r 
right join categories as c
on r.category_id = c.id
group by c.id
order by category_name;



-- Task 10
select distinct c.name as category_name
from reports as r 
join users as u
on r.user_id = u.id
join categories as c
on r.category_id = c.id
where day(r.open_date) = day(u.birthdate) and month(r.open_date) = month(u.birthdate)
order by category_name;



-- Task 11
select concat(e.first_name, ' ', e.last_name) as name,
		count(distinct r.user_id) as users_count
from reports as r 
join employees as e
on r.employee_id = e.id
group by e.id
order by users_count desc, name;




-- Task 12
select r.open_date, r.description, u.email as reporter_email
from reports as r
join users as u
on r.user_id = u.id
join categories as c
on r.category_id = c.id
join departments as d
on c.department_id = d.id 
where r.close_date is null and char_length(r.description) > 20 and 
      d.name in ('Emergency', 'Infrastructure', 'Roads Maintenance')
      and r.description like '%str%' > 0
order by open_date, reporter_email;




--Task 13
select distinct u.username 
from reports as r
join users as u
on r.user_id = u.id
where left(u.username,1) = r.category_id or 
	  right(u.username,1) = r.category_id
order by u.username;



--Task 14
select concat(e.first_name, ' ', e.last_name) as fn,
		concat(count(case
				when year(r.close_date) = 2016 then 'closed'
			  end), '/',
		count(case 
				when year(r.open_date) = 2016 then 'opened'
				end) ) as closed_open_reports
from reports as r
join employees as e on r.employee_id = e.id
where year(r.open_date) = 2016 or year(r.close_date) = 2016
group by e.id
order by fn;



--Task 15 
select d.name as department_name, 
		if( avg(datediff(r.close_date, r.open_date)) is not null,
			floor(avg(datediff(r.close_date, r.open_date))), 'no info' 
		  ) as average_duration
from reports as r
join categories as c on c.id = r.category_id
join departments as d on d.id = c.department_id
group by d.id
order by d.name;




--Task 16
select  d.name, c.name, 
floor(count(r.id)*100 / (
					select  count(r1.id)
					from reports as r1
					join categories as c1 on c1.id = r1.category_id
					join departments as d1 on d1.id = c1.department_id
					where d1.name = d.name
					group by d1.name
				  )) emb
from reports as r
join categories as c on c.id = r.category_id
join departments as d on d.id = c.department_id
group by d.name, c.name
order by d.name, c.name;


