
CREATE TABLE IF NOT EXISTS complaints_311 (
    id INTEGER PRIMARY KEY,
    created_date TIMESTAMP,
    incident_zip VARCHAR(15),
    complaint_type VARCHAR(100),
    latitude DECIMAL,
    longitude DECIMAL,    
    geometry GEOMETRY(Point, 4326)
);

CREATE TABLE IF NOT EXISTS trees (
    tree_id INTEGER PRIMARY KEY,
    status VARCHAR(50),
    health VARCHAR(50),
    zipcode VARCHAR(15),
    zip_city VARCHAR(100),
    boroname VARCHAR(100),
    latitude DECIMAL,
    longitude DECIMAL,
    geomrtry GEOMETRY(Point, 4326)
);    
    
CREATE TABLE IF NOT EXISTS historical_rent (
    id SERIAL PRIMARY KEY,
    RegionName VARCHAR(200),
    City VARCHAR(200),
    CountyName VARCHAR(200),
    Date DATE,
    Rent FLOAT
);

CREATE TABLE IF NOT EXISTS nyc_zipcodes (
    id SERIAL PRIMARY KEY,
    ZIPCODE VARCHAR(15),
    PO_NAME VARCHAR(30), 
    COUNTY VARCHAR(30), 
    geometry GEOMETRY(Point, 4326)
);

