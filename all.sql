select * from person;
select * from departments;
select * from locations;
select * from categories;

select person_id as _id, category, countries.country, locations.loc AS location, person.name, person.salary,person.gender,departments.department 
from (((countries join locations on((countries.country_id = locations.country_id))) 
        join person on((locations.loc_id = person.loc_id))) 
        join departments on((person.dept_id = departments.dept_id)) 
        join categories on (categories.cat_id=person.cat_id))
