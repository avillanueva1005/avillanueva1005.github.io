CREATE TABLE flood2 AS
SELECT *,id AS id_num, flood_leve AS metersdeep, flood_leve / 3.28 AS feetdeep
FROM flood;

UPDATE flood2
SET geom = st_makevalid(geom);

SELECT *, st_area(geom) as area_m2
FROM flood2;

ALTER TABLE flood2
ADD COLUMN area_m2 int;

UPDATE flood2
SET area_m2 = st_area(geom)

ALTER TABLE flood2
ADD COLUMN area_km2 int;

UPDATE flood2
SET area_km2 = area_m2 / 1000;

SELECT distinct amenity
FROM planet_osm_polygon;

CREATE TABLE school AS
SELECT *
FROM planet_osm_polygon
WHERE amenity = 'university' OR amenity = 'school' OR amenity = 'college' OR amenity = 'driving_school' OR amenity = 'kindergarten' OR amenity = 'School and Vocation Training Centre';

SSELECT distinct amenity
FROM planet_osm_polygon;

CREATE TABLE religious AS
SELECT *
FROM planet_osm_polygon
WHERE amenity = 'church' OR amenity = 'place_of_worship';

SELECT osm_id, name,religion, st_centroid(way)::geometry(point, 4326) as way
FROM religious;

select ammenity, geom, min(std) as minstd
 from
(select flood2.*, religious.name as name, st_distance(flood2.geom, religious.geom) as std
from flood2 left outer join religious
on st_dwithin(flood2.geom, religious.geom, 60000)) as a
group by ammenity, geom
