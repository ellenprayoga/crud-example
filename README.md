1. Used technologies
- Programming Language : JAVA (version 1.8), JAVA EE (version 8.0) & JSTL (version 1.2)
- Database : MySQL (version 8.0.11) & MySQL Connector (version 8.0.13)
- Framework : Spring (version 4.3.20.RELEASE), Hibernate (version 5.3.7.Final), Bootstrap (version 4.1.1)
- Unit Testing : jUnit (version 4.12)
- Buildtool : Maven (version 4.0.0)


2. Database
There are two tables employee and progLang.

employee table
id INT AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(255),
gender VARCHAR(255),
address VARCHAR(255),
phone_number VARCHAR(255),
email VARCHAR(255),
skill VARCHAR(255);

Employee table contains all employees data like name, gender, address, etc.

progLang table
id INT AUTO_INCREMENT PRIMARY KEY,
progLang VARCHAR(255);

ProgLang table contains list of programming language that will be choosed by employee as employee's skill.


3. Using program

In the main page there is a table containing list of employees data and there are some buttons that can be used to do
CRUD operation.

- Blue button : Updating employee's data
- Yellow button : Deleting employee's data
- Green button : Adding new employee's data
