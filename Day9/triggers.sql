select concat(customers.contactFirstName, ' ', customers.contactLastName) AS 'Klients', customers.phone, offices.country
from customers
inner join employees on customers.salesRepEmployeeNumber=employees.employeeNumber
inner join offices on employees.officeCode=offices.officeCode
where customers.country = "USA";



DELIMITER  $$

CREATE TRIGGER before_firstName_update
BEFORE UPDATE
ON employees FOR EACH ROW
BEGIN
	IF new.firstName = "Janis" THEN
		set new.firstName = "John";
    END IF;
END$$

DELIMITER  ;


UPDATE employees SET firstName = "Janis"
WHERE employeeNumber = 1286;


ALTER TABLE employees
ADD salary INT;



DELIMITER  $$

CREATE TRIGGER before_salary_insert
BEFORE INSERT
ON employees FOR EACH ROW
BEGIN
	IF new.salary < 430  THEN
		set new.salary = 430;
    END IF;
END$$

DELIMITER  ;



SELECT * FROM classicmodels.employees;

INSERT INTO employees (employeeNumber, lastName, firstName, extension, email, officeCode, reportsTo, jobTitle, salary)
VALUES (9998, "Marston", "John", "x5800", "john@classic.com", 1, 1002, "Sales Rep", 300);



