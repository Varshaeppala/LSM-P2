-- Library Management System Project 

--Creating Branch Table 

DROP TABLE IF EXISTS branch;
CREATE TABLE branch
	(
		branch_id VARCHAR(10) PRIMARY KEY,
		Manager_id VARCHAR(10),
		branch_address VARCHAR(55),
		contact_no VARCHAR(10)

	);

ALTER TABLE branch
ALTER COLUMN contact_no TYPE VARCHAR(20);

DROP TABLE IF EXISTS employees;
CREATE TABLE employees
	(
		emp_id VARCHAR(10) PRIMARY KEY,
		emp_name VARCHAR(25),
		postion VARCHAR(15),
		salary INT,
		branch_id VARCHAR(25)-- FK
	);

ALTER TABLE employee
ALTER COLUMN position TYPE VARCHAR(30);


DROP TABLE IF EXISTS books;
CREATE TABLE books
	(
		isbn VARCHAR(20) PRIMARY KEY,
		book_title VARCHAR(75),
		category VARCHAR(10),
		rental_price FLOAT,
		status VARCHAR(15),
		author VARCHAR(35),
		publisher VARCHAR(55)
	);

DROP TABLE IF EXISTS members;	
CREATE TABLE members
(
	member_id VARCHAR(20) PRIMARY KEY ,
	member_name VARCHAR(25),
	member_address VARCHAR(75),
	reg_date DATE
);

SELECT * FROM members WHERE member_id = 'C101';

DROP TABLE IF EXISTS members;	
CREATE TABLE issued_status
(
	issued_id VARCHAR(10) PRIMARY KEY,
	issued_member_id VARCHAR(10),--FK
	issued_book_name VARCHAR(75),
	issued_date DATE,
	issued_book_isbn  VARCHAR(25),--FK
	issued_emp_id VARCHAR(10)--FK
);

DROP TABLE IF EXISTS members;
CREATE TABLE return_status
(
	return_id VARCHAR(10) PRIMARY KEY,
	issued_id VARCHAR(10),
	return_book_name VARCHAR(75),  
	return_date DATE,
	return_book_isbn VARCHAR(20)
);

--FOREIGN KEY 
ALTER TABLE issued_status
ADD CONSTRAINT fk_members
FOREIGN KEY (issued_member_id)
REFERENCES members (member_id);

ALTER TABLE issued_status
ADD CONSTRAINT fk_books
FOREIGN KEY (issued_book_isbn)
REFERENCES books (isbn);


ALTER TABLE employees
ADD CONSTRAINT fk_branch
FOREIGN KEY (branch_id)
REFERENCES branch(branch_id);

ALTER TABLE return_status
ADD CONSTRAINT fk_issued_status
FOREIGN KEY (issued_id)
REFERENCES issued_status(issued_id);


