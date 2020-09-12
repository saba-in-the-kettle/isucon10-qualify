USE isuumo;

UPDATE chair SET width_range = 1 WHERE width >= 80 AND width < 110;
UPDATE chair SET width_range = 2 WHERE width >= 110 AND width < 150;
UPDATE chair SET width_range = 3 WHERE width >= 150;

UPDATE chair SET height_range = 1 WHERE height >= 80 AND height < 110;
UPDATE chair SET height_range = 2 WHERE height >= 110 AND height < 150;
UPDATE chair SET height_range = 3 WHERE height >= 150;

UPDATE chair SET depth_range = 1 WHERE depth >= 80 AND depth < 110;
UPDATE chair SET depth_range = 2 WHERE depth >= 110 AND depth < 150;
UPDATE chair SET depth_range = 3 WHERE depth >= 150;

UPDATE chair SET price_range = 1 WHERE price >= 3000 AND depth < 6000;
UPDATE chair SET price_range = 2 WHERE price >= 6000 AND depth < 9000;
UPDATE chair SET price_range = 3 WHERE price >= 9000 AND depth < 12000;
UPDATE chair SET price_range = 4 WHERE price >= 12000 AND depth < 15000;
UPDATE chair SET price_range = 5 WHERE price >= 15000;

ALTER TABLE chair DROP INDEX idx_chair_price;
ALTER TABLE chair DROP INDEX idx_chair_width;
ALTER TABLE chair DROP INDEX idx_chair_height;
ALTER TABLE chair DROP INDEX idx_chair_depth;

UPDATE estate SET door_width_range = 1 WHERE door_width >= 80 AND door_width < 110;
UPDATE estate SET door_width_range = 2 WHERE door_width >= 110 AND door_width < 150;
UPDATE estate SET door_width_range = 3 WHERE door_width >= 150;

UPDATE estate SET door_height_range = 1 WHERE door_height >= 80 AND door_height < 110;
UPDATE estate SET door_height_range = 2 WHERE door_height >= 110 AND door_height < 150;
UPDATE estate SET door_height_range = 3 WHERE door_height >= 150;

UPDATE estate SET rent_range = 1 WHERE rent >= 50000 AND rent < 100000;
UPDATE estate SET rent_range = 2 WHERE rent >= 100000 AND rent < 150000;
UPDATE estate SET rent_range = 3 WHERE rent >= 150000;
