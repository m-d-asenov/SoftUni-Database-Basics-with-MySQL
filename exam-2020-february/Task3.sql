use fsd;

update coaches 
left join players_coaches on coaches.id = players_coaches.coach_id
set coaches.coach_level = coaches.coach_level + 1
where players_coaches.player_id is not null 
and left(coaches.first_name,1) = 'A';