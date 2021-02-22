select concat(employees.firstName , ' ' , employees.lastName) AS 'Darbinieki', offices.country
from employees, offices
WHERE employees.officeCode=offices.officeCode;

select concat(employees.firstName , ' ' , employees.lastName) AS 'Darbinieki', offices.country
from employees
inner join offices on employees.officeCode=offices.officeCode


select concat(employees.firstName , ' ' , employees.lastName) AS 'Darbinieks', customers.customerName as 'Klients', customers.city as 'Pilseta', orders.orderDate
from employees
inner join customers on employees.employeeNumber = customers.salesRepEmployeeNumber
inner join orders on customers.customerNumber = orders.customerNumber;