CREATE TABLE test_table (
	school VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	age INT NOT NULL,
	address VARCHAR(255) NOT NULL,
	famsize	VARCHAR(255) NOT NULL,
	Pstatus	VARCHAR(255) NOT NULL,
	Medu VARCHAR(255) NOT NULL,
	Fedu VARCHAR(255) NOT NULL,
	Mjob VARCHAR(255) NOT NULL,
	Fjob VARCHAR(255) NOT NULL,
	reason VARCHAR(255) NOT NULL,
	guardian VARCHAR(255) NOT NULL,
	traveltime VARCHAR(255) NOT NULL,
	studytime VARCHAR(255) NOT NULL,
	failures INT NOT NULL,
	schoolsup VARCHAR(255) NOT NULL,
	famsup VARCHAR(255) NOT NULL,
	paid VARCHAR(255) NOT NULL,
	activities VARCHAR(255) NOT NULL,
	nursery VARCHAR(255) NOT NULL,
	higher VARCHAR(255) NOT NULL,
	internet VARCHAR(255) NOT NULL,
	romantic VARCHAR(255) NOT NULL,
	famrel VARCHAR(255) NOT NULL,
	freetime VARCHAR(255) NOT NULL,
	goout VARCHAR(255) NOT NULL,
	Dalc VARCHAR(255) NOT NULL,
	Walc VARCHAR(255) NOT NULL,
	health VARCHAR(255) NOT NULL,
	absences VARCHAR(255) NOT NULL,
	G1 INT NOT NULL,
	G2 INT NOT NULL,
	G3 INT NOT NULL);
	
LOAD DATA LOCAL INFILE '/Users/rachanbassi/Documents/Data_Vis/information_visualization/student-mat.csv' INTO TABLE test_table FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\n';

select tab.studytime, tab.absences, AVG(tab.G3) from (select studytime, absences, G3 from test_table) as tab group by tab.studytime, tab.absences ;

select * from test_table;