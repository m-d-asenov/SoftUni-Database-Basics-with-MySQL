select br.name, count(c.id) as count_of_cards
from branches as br
left join employees as e
on br.id = e.branch_id
left join employees_clients as ec
on ec.employee_id = e.id
left join clients as cl
on ec.client_id = cl.id
left join bank_accounts as ba
on cl.id = ba.client_id
left join cards as c
on ba.id = c.bank_account_id
group by br.name
order by count_of_cards desc, br.name;