-- I'll create the tables that are needed. 

-- Creating the Departments table
CREATE TABLE Departments (
    dept_no VARCHAR(15) PRIMARY KEY NOT NULL,
    dept_name VARCHAR(60) NOT NULL
);

-- Creating the Titles table
CREATE TABLE Titles (
    title_id VARCHAR(15) PRIMARY KEY NOT NULL,
    title VARCHAR(40) NOT NULL
);

-- Creating the Employees table
CREATE TABLE Employees (
    emp_no INT PRIMARY KEY NOT NULL,
    emp_title_id VARCHAR(10) REFERENCES Titles(title_id),
    birth_date DATE NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL,
    sex VARCHAR(6) NOT NULL,
    hire_date DATE NOT NULL
);

-- Creating the Dept_emp table
CREATE TABLE Dept_emp (
    emp_no INT NOT NULL REFERENCES Employees(emp_no),
    dept_no VARCHAR(15) NOT NULL REFERENCES Departments(dept_no)
);

-- Creating the Dept_manager table
CREATE TABLE Dept_manager (
    dept_no VARCHAR(15) NOT NULL REFERENCES Departments(dept_no),
    emp_no INT NOT NULL REFERENCES Employees(emp_no)
);

-- Creating the Salaries table 
CREATE TABLE Salaries (
    emp_no INT NOT NULL REFERENCES Employees(emp_no),
    salary INT NOT NULL
);



