select concat(e.first_name, ' ', e.last_name) as name, 
		e.started_on,emb_q.count_clients
from employees as e
join   (select ec.employee_id as empl_id, count(ec.client_id) as count_clients
		from employees_clients as ec
        group by ec.employee_id) as emb_q
on e.id = emb_q.empl_id
order by emb_q.count_clients desc, e.id
limit 5;