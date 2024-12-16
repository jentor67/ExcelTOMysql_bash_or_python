USE transactions;

DROP TABLE IF EXISTS `csvFile`;

CREATE TABLE csvFile (
	`Material Document` TINYTEXT,
	`Material` TINYTEXT, 
	`Material Description` TINYTEXT,
	`Movement Type` TINYTEXT,
	`Special Stock` TINYTEXT,
	`Storage Location` TINYTEXT,
	`Qty` TINYTEXT,
	`Unit of Entry` TINYTEXT,
	`Base Unit of Measure` TINYTEXT,
	`Posting Date` TINYTEXT,
	`Time of Entry` TINYTEXT,
	`User name` TINYTEXT,
	`Document Header Text` TINYTEXT,
	`Reference` TINYTEXT,
	`G/L Account` TINYTEXT,
	`Cost Center` TINYTEXT,
	`Transaction Code` TINYTEXT
);

LOAD DATA LOCAL INFILE 'output.csv'
INTO TABLE csvFile
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS (
	`Material Document`,
	`Material`, 
	`Material Description`,
	`Movement Type`,
	`Special Stock`,
	`Storage Location`,
	`Qty`,
	`Unit of Entry`,
	`Base Unit of Measure`,
	`Posting Date`,
	`Time of Entry`,
	`User name`,
	`Document Header Text`,
	`Reference`,
	`G/L Account`,
	`Cost Center`,
	`Transaction Code`
);
