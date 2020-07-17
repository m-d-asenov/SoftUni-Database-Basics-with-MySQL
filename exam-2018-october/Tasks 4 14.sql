-- Task 4
select card_number, job_during_journey
from travel_cards
order by card_number;


-- Task 5
select id, concat(first_name, ' ', last_name) as full_name, ucn 
from colonists
order by first_name, last_name, id;


-- Task 6
select id, journey_start, journey_end
from journeys
where purpose = 'Military'
order by journey_start;


-- Task 7
select c.id, concat(c.first_name, ' ', c.last_name) as full_name  
from colonists as c
join travel_cards as tc
on c.id = tc.colonist_id
where tc.job_during_journey = 'Pilot'
order by c.id;


-- Task 8
select count(tc.id) as count
from travel_cards as tc
join journeys as j 
on tc.journey_id = j.id
where j.purpose = 'Technical';


-- Task 9
select ships.name as spaceship_name, ports.name as spaceport_name
from journeys as j
join spaceships as ships
on j.spaceship_id = ships.id
join spaceports as ports
on j.destination_spaceport_id = ports.id
order by ships.light_speed_rate desc
limit 1;


-- Task 10
select ships.name as name, ships.manufacturer as manufacturer 
from journeys as j
join spaceships as ships
on j.spaceship_id = ships.id
join travel_cards as tc
on j.id = tc.journey_id
join colonists as c
on tc.colonist_id = c.id
where tc.job_during_journey = 'Pilot' and year(c.birth_date) > year(DATE_SUB('2019-01-01', INTERVAL 30 YEAR))
order by ships.name;


-- Task 11
select p.name as planet_name, s.name as spaceport_name
from planets as p
join spaceports as s
on p.id = s.planet_id
join journeys as j
on s.id = j.destination_spaceport_id
where purpose = 'Educational'
order by spaceport_name desc;


-- Task 12
select p.name as planet_name, count(j.id) as journeys_count
from planets as p
join spaceports as s
on p.id = s.planet_id
join journeys as j
on s.id = j.destination_spaceport_id
group by planet_name
order by journeys_count desc, planet_name;


-- Task 13
select j.id, p.name as planet_name, s.name as spaceport_name, j.purpose as journey_purpose
from planets as p
join spaceports as s
on p.id = s.planet_id
join journeys as j
on s.id = j.destination_spaceport_id
order by j.journey_end - j.journey_start
limit 1;



-- Task 14
SELECT tc.job_during_journey
FROM travel_cards tc
WHERE tc.journey_id =  (
  SELECT j.id
  FROM journeys j
  ORDER BY DATEDIFF(j.journey_end, j.journey_start) DESC
  LIMIT 1
)
GROUP BY tc.job_during_journey
ORDER BY count(tc.job_during_journey)
LIMIT 1;
