CREATE SCHEMA SQL_PUZZLES;

SET SCHEMA sql_puzzles;

DROP TABLE IF EXISTS ABSENTEESIM;

CREATE TABLE ABSENTEESIM
(EMP_ID INTEGER NOT NULL 
 REFERENCES 
 PERSONNEL(EMP_ID),
 ABSENT_DATE DATE NOT NULL,
 REASON_CODE CHAR(40) NOT NULL REFERENCES EXCUSElIST(REASON_CODE),
 SEVERITY_POINTS INTEGER NOT NULL CHECK(SEVERITY_POINTS BETWEEN 0 AND 4),
 PRIMARY KEY (EMP_ID, ABSENT_DATE));
 
 CREATE TABLE PERSONNEL
 (EMP_ID INTEGER NOT NULL,
 EMP_NAME VARCHAR(50) NOT NULL,
 PRIMARY KEY(EMP_ID));
 
 CREATE TABLE EXCUSELIST
 (REASON_CODE CHAR(40),
 EXPLANATION VARCHAR(200),
 PRIMARY KEY(REASON_CODE));
 
 DROP TABLE ALPHA_TABLE;
 CREATE TABLE ALPHA_TABLE
 (ONLY_ALPHA VARCHAR(6) NOT NULL CHECK(regexp_matches(ONLY_ALPHA,'[a-zA-Z]*'));
 
 INSERT INTO ALPHA_TABLE VALUES('SRID13');