USE isuumo;

ALTER TABLE estate ADD geom geometry;

UPDATE estate SET geom = ST_GeomFromText(CONCAT('POINT(', latitude, ' ', longitude, ')'));
