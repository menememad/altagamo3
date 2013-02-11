

SELECT property.id,property.description,property.status,property.prp_for,property.price,property.area ,country.*, state.*,prop_type.* 
FROM property
LEFT OUTER JOIN prop_type ON property.property_type_id = prop_type.id 
LEFT OUTER JOIN country ON property.country_id = country.id 
LEFT OUTER JOIN state ON property.state_id = state.id 
LEFT OUTER JOIN city ON property.city_id = city.id 
LEFT OUTER JOIN district ON property.district_id = district.id 
LEFT OUTER JOIN compound ON property.compound_id = compound.id 
LEFT OUTER JOIN zone ON property.zone_id = zone.id 
LEFT OUTER JOIN subarea ON property.subarea_id = subarea.id
 WHERE 1=1 
 AND property.description LIKE '% %'
 AND property.property_type_id IN (1,2,3)
 AND property.prp_for = 1 
 AND property.rental_period in(1,2,3)
 AND property.price BETWEEN 100000 AND 500000
 AND property.area BETWEEN 100 AND 200
 AND property.country_id = 1
 AND property.state_id = 1
 AND property.city_id = 1
 AND property.compound_id = 1
 AND property.district_id = 1
 AND property.zone_id = 1
 AND property.subarea_id = 1
 AND property.rent_start BETWEEN AND 
 AND property.rent_end BETWEEN AND 
 AND property.status IN (1,2,3,4)
 AND property.approved_at BETWEEN AND
 AND property.approved_by = 'admin'
 AND property.bedroomsNo BETWEEN 1 AND 10
 AND property.hallroomsNo BETWEEN 1 AND 10
 AND property.bathroomsNo BETWEEN 1 AND 10
 AND property.floorNo BETWEEN 1 AND 10
 AND property.subtype = 1
 AND property.furn_status = 3
 AND property.finish_status = 1
 AND property.created_at BETWEEN AND
 AND property.created_by = 'admin'
 AND property.pay_type = 1
 AND property.pay_in_advance =< 200000
 AND property.rental_period IN (1,2,3,4)
 
select count(*) 
from property 
left outer join country on property.country_id = country.id 
left outer join state on property.state_id = state.id 
left outer join city on property.city_id = city.id 
left outer join district on property.district_id = district.id 
left outer join compound on property.compound_id = compound.id 
left outer join zone on property.zone_id = zone.id 
left outer join subarea on property.subarea_id = subarea.id;

SELECT property.* ,country.*, state.*, prop_type.*, users.* FROM property LEFT OUTER JOIN users ON property.created_by = users.id LEFT OUTER JOIN prop_type ON property.property_type_id = prop_type.id LEFT OUTER JOIN country ON property.country_id = country.id LEFT OUTER JOIN state ON property.state_id = state.id LEFT OUTER JOIN city ON property.city_id = city.id LEFT OUTER JOIN district ON property.district_id = district.id LEFT OUTER JOIN compound ON property.compound_id = compound.id LEFT OUTER JOIN zone ON property.zone_id = zone.id LEFT OUTER JOIN subarea ON property.subarea_id = subarea.id WHERE 1=1  AND property.prp_for IN(1,3) LIMIT 0,20
SELECT property.* ,country.*, state.*, prop_type.*, users.* FROM property LEFT OUTER JOIN users ON property.created_by = users.id LEFT OUTER JOIN prop_type ON property.property_type_id = prop_type.id LEFT OUTER JOIN country ON property.country_id = country.id LEFT OUTER JOIN state ON property.state_id = state.id LEFT OUTER JOIN city ON property.city_id = city.id LEFT OUTER JOIN district ON property.district_id = district.id LEFT OUTER JOIN compound ON property.compound_id = compound.id LEFT OUTER JOIN zone ON property.zone_id = zone.id LEFT OUTER JOIN subarea ON property.subarea_id = subarea.id WHERE 1=1  AND property.status = '2'  AND property.property_type_id IN (1);
AND property.rental_period IN(null)  AND property.subtype IN (null)  AND property.furn_status IN (null)  AND property.finish_status IN (null)  AND property.rental_period IN (null)  LIMIT 0,20

SELECT city.*, state.id AS parent_id, state.name_ar AS parent_name_ar, state.name_en AS parent_name_en FROM city, state WHERE city.state_id = state.id AND state_id = 1 AND city.active_flag='1' AND state.active_flag='1'

UPDATE property SET status=1, approved_at=NULL, approved_by=NULL WHERE id in (1,2,6) 
select id, approved_at, approved_by, status from property

SELECT property.* ,country.*, state.*, prop_type.*, users.* 
FROM property 
LEFT OUTER JOIN users ON property.created_by = users.id 
LEFT OUTER JOIN prop_type ON property.property_type_id = prop_type.id 
LEFT OUTER JOIN country ON property.country_id = country.id 
LEFT OUTER JOIN state ON property.state_id = state.id 
LEFT OUTER JOIN city ON property.city_id = city.id 
LEFT OUTER JOIN district ON property.district_id = district.id 
LEFT OUTER JOIN compound ON property.compound_id = compound.id 
LEFT OUTER JOIN zone ON property.zone_id = zone.id 
LEFT OUTER JOIN subarea ON property.subarea_id = subarea.id 
WHERE 1=1  AND property.status = '2'  LIMIT 0,5

SELECT property_id FROM favorites WHERE user_id =15

SELECT id,title,description,"order",created_at FROM project WHERE active_flag = 1 ORDER BY created_at;
INSERT INTO project (title,description,row_order,active_flag) VALUES('Project 1','Hi hi',1,'1');

SELECT id,title,description,row_order,created_at FROM project WHERE active_flag = 1 ORDER BY created_at

--------------------------------------------------------------------
CREATE TABLE project (
 id INT NOT NULL AUTO_INCREMENT ,
 title VARCHAR(100) NOT NULL ,
 description VARCHAR(1000) NULL ,
 row_order INT(11) NULL DEFAULT NULL ,
 created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
 active_flag CHAR(1) DEFAULT '1' ,
 video_link VARCHAR(100) NULL ,
 img_count INT NULL DEFAULT 0 ,
 PRIMARY KEY (`id`) )
COMMENT = 'list all the projets made by Allamco in the new cairo';
---------------------------------------------------------------------
