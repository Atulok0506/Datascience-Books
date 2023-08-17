CREATE DATABASE GFGTEST;
USE GFGTEST;
DESC GFGTEST;
SHOW DATABASES;
USE GFGTEST;
CREATE TABLE StudentDetails
(
	S_ID INT(10),
    NAME CHAR(30),
    ADDRESS VARCHAR(50)
) ;
CREATE TABLE StudentMarks
(
	ID INT(20),
    NAME CHAR(50),
    MARKS INT(20),
    AGE INT(10)
) ;   
    ALTER TABLE StudentMarks 
    ADD PRIMARY KEY (ID);
    ALTER TABLE StudentMarks
    CHANGE COLUMN ID ID INT(20) UNIQUE;
    SELECT * FROM StudentMarks;
    INSERT INTO StudentDetails VALUES (1,'HARSH','KOLKATA'),
									  (2, 'ASHISH','DURGAPUR'),
                                      (3, 'SANJAY','PATNA'),
                                      (4, 'VIKASH','BANARAS'),
                                      (5, 'RAJEEV','DELHI');
                                      
	SELECT * FROM StudentDetails;
    INSERT INTO StudentMarks VALUES (1, 'HARSH', 90, 19),
									(2, 'ASHISH', 88, 19),
                                    (3, 'SANJAY', 91, 21),
                                    (4, 'VIKASH', 95, 20),
                                    (5, 'RAJEEV', 87, 19);
							
   SELECT * FROM StudentMarks;   
   SELECT NAME,AGE
   FROM StudentMarks
   where AGE > 19;
   SELECT StudentDeatils.NAME,
   StudentMarks.NAME,
   StudentMarks.AGE,
   StudentMarks.MARKS,
   StudentMarks.ADDRESS
   FROM StudentDetails, StudentMarks
   WHERE StudentDetails.NAME = StudentMarks.NAME ; 
   
   SELECT StudentDetails.NAME,
   StudentDetails.ADDRESS,
   StudentMarks.MARKS,
   StudentMarks.AGE
   
   
   