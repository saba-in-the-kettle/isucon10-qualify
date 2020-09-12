DROP DATABASE IF EXISTS isuumo;
CREATE DATABASE isuumo;

DROP TABLE IF EXISTS isuumo.estate;
DROP TABLE IF EXISTS isuumo.chair;

CREATE TABLE isuumo.estate
(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    thumbnail VARCHAR(128) NOT NULL,
    address VARCHAR(128) NOT NULL,
    latitude DOUBLE PRECISION NOT NULL,
    longitude DOUBLE PRECISION NOT NULL,
    rent INTEGER NOT NULL,
    door_height INTEGER NOT NULL,
    door_width INTEGER NOT NULL,
    features VARCHAR(64) NOT NULL,
    popularity INTEGER NOT NULL
);

CREATE TABLE isuumo.chair
(
    id INTEGER NOT NULL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    description VARCHAR(4096) NOT NULL,
    thumbnail VARCHAR(128) NOT NULL,
    price INTEGER NOT NULL,
    height INTEGER NOT NULL,
    width INTEGER NOT NULL,
    depth INTEGER NOT NULL,
    color VARCHAR(64) NOT NULL,
    features VARCHAR(64) NOT NULL,
    kind VARCHAR(64) NOT NULL,
    popularity INTEGER NOT NULL,
    stock INTEGER NOT NULL
);

USE isuumo;
CREATE INDEX search_chair ON chair (price, height, width, depth, kind, color, features);

ALTER TABLE chair ADD INDEX idx_stock_price_id(stock, price, id);
ALTER TABLE estate ADD INDEX idx_rent_id(rent, id);
ALTER TABLE estate ADD INDEX idx_door_width_door_height(door_width, door_height);
ALTER TABLE estate ADD INDEX idx_latitude_longitude_popularity_id(latitude, longitude, popularity, id);
ALTER TABLE estate ADD INDEX idx_door_width_door_height(door_width, door_height,popularity desc, id);
