DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id          INTEGER             NOT NULL PRIMARY KEY,
    name        VARCHAR(64)         NOT NULL,
    description VARCHAR(4096)       NOT NULL,
    thumbnail   VARCHAR(128)        NOT NULL,
    address     VARCHAR(128)        NOT NULL,
    latitude    DOUBLE PRECISION    NOT NULL,
    longitude   DOUBLE PRECISION    NOT NULL,
    rent        INTEGER             NOT NULL,
    door_height INTEGER             NOT NULL,
    door_width  INTEGER             NOT NULL,
    features    VARCHAR(64)         NOT NULL,
    popularity  INTEGER             NOT NULL
);

CREATE TABLE isuumo.chair
(
    id          INTEGER         NOT NULL PRIMARY KEY,
    name        VARCHAR(64)     NOT NULL,
    description VARCHAR(4096)   NOT NULL,
    thumbnail   VARCHAR(128)    NOT NULL,
    price       INTEGER         NOT NULL,
    height      INTEGER         NOT NULL,
    width       INTEGER         NOT NULL,
    depth       INTEGER         NOT NULL,
    color       VARCHAR(64)     NOT NULL,
    features    VARCHAR(64)     NOT NULL,
    kind        VARCHAR(64)     NOT NULL,
    popularity  INTEGER         NOT NULL,
    stock       INTEGER         NOT NULL
);

USE isuumo;
-- CREATE INDEX search_chair ON chair (price, height, width, depth, kind, color, features);

ALTER TABLE chair ADD INDEX idx_stock_price_id(stock, price, id);
ALTER TABLE estate ADD INDEX idx_rent_id(rent, id);
ALTER TABLE estate ADD INDEX idx_door_width_door_height(door_width, door_height);
ALTER TABLE estate ADD INDEX idx_latitude_longitude_popularity_id(latitude, longitude, popularity, id);

ALTER TABLE chair ADD width_range SMALLINT
ALTER TABLE chair ADD height_range SMALLINT
ALTER TABLE chair ADD depth_range SMALLINT
ALTER TABLE chair ADD price_range SMALLINT

CREATE INDEX search_chair_price ON chair (price_range);
CREATE INDEX search_chair_height ON chair (height_range);
CREATE INDEX search_chair_width ON chair (width_range);
CREATE INDEX search_chair_depth ON chair (depth_range);
CREATE INDEX search_chair_color ON chair (color);
CREATE INDEX search_chair_kind ON chair (kind);

UPDATE chair SET width_range = 0 WHERE width < 80;
UPDATE chair SET width_range = 1 WHERE width >= 80 AND width < 110;
UPDATE chair SET width_range = 2 WHERE width >= 110 AND width < 150;
UPDATE chair SET width_range = 3 WHERE width >= 150;

UPDATE chair SET height_range = 0 WHERE height < 80;
UPDATE chair SET height_range = 1 WHERE height >= 80 AND height < 110;
UPDATE chair SET height_range = 2 WHERE height >= 110 AND height < 150;
UPDATE chair SET height_range = 3 WHERE height >= 150;

UPDATE chair SET depth_range = 0 WHERE depth < 80;
UPDATE chair SET depth_range = 1 WHERE depth >= 80 AND depth < 110;
UPDATE chair SET depth_range = 2 WHERE depth >= 110 AND depth < 150;
UPDATE chair SET depth_range = 3 WHERE depth >= 150;

UPDATE chair SET price_range = 0 WHERE price < 3000;
UPDATE chair SET price_range = 1 WHERE price >= 3000 AND depth < 6000;
UPDATE chair SET price_range = 2 WHERE price >= 6000 AND depth < 9000;
UPDATE chair SET price_range = 3 WHERE price >= 9000 AND depth < 12000;
UPDATE chair SET price_range = 4 WHERE price >= 12000 AND depth < 15000;
UPDATE chair SET price_range = 5 WHERE price >= 15000;


