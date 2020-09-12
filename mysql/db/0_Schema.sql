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
CREATE INDEX search_chair ON chair (price, height, width, depth, kind, color, features);

ALTER TABLE chair ADD INDEX idx_stock_price_id(stock, price, id);
ALTER TABLE estate ADD INDEX idx_rent_id(rent, id);
ALTER TABLE estate ADD INDEX idx_door_width_door_height(door_width, door_height);
ALTER TABLE estate ADD INDEX idx_latitude_longitude_popularity_id(latitude, longitude, popularity, id);

ALTER TABLE chair ADD INDEX idx_chair_price (price);
ALTER TABLE chair ADD INDEX idx_chair_width (width);
ALTER TABLE chair ADD INDEX idx_chair_height (height);
ALTER TABLE chair ADD INDEX idx_chair_depth (depth);

ALTER TABLE chair ADD width_range SMALLINT DEFAULT 0;
ALTER TABLE chair ADD height_range SMALLINT DEFAULT 0;
ALTER TABLE chair ADD depth_range SMALLINT DEFAULT 0;
ALTER TABLE chair ADD price_range SMALLINT DEFAULT 0;

CREATE INDEX search_chair_price ON chair (price_range);
CREATE INDEX search_chair_height ON chair (height_range);
CREATE INDEX search_chair_width ON chair (width_range);
CREATE INDEX search_chair_depth ON chair (depth_range);
CREATE INDEX search_chair_color ON chair (color);
CREATE INDEX search_chair_kind ON chair (kind);

ALTER TABLE estate ADD rent_range SMALLINT DEFAULT 0;
ALTER TABLE estate ADD door_height_range SMALLINT DEFAULT 0;
ALTER TABLE estate ADD door_width_range SMALLINT DEFAULT 0;

ALTER TABLE estate ADD INDEX idx_estate_rent (rent);
ALTER TABLE estate ADD INDEX idx_estate_d_h (door_height);
ALTER TABLE estate ADD INDEX idx_estate_d_w (door_width);

CREATE INDEX search_estate_rent ON estate (rent_range);
CREATE INDEX search_estate_d_h ON estate (door_height_range);
CREATE INDEX search_estate_d_w ON estate (door_width_range);
