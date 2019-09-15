set dict+=~/mydict/sql
set complete+=k~/mydict/sql

setlocal ic

packadd completeall

inoreabbrev ct      CREATE TABLE
inoreabbrev cd      CREATE DATABASE
inoreabbrev sl      SELECT
inoreabbrev sall    SELECT * FROM
inoreabbrev at      ALTER TABLE
inoreabbrev pk      PRIMARY KEY
inoreabbrev ai      AUTO_INCREMENT
inoreabbrev vc      VARCHAR
inoreabbrev dt      DATETIME
