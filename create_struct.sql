CREATE SCHEMA `go_company` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
ALTER SCHEMA `go_company` DEFAULT COLLATE utf8_general_ci;
USE go_company;
CREATE TABLE go_company.company (
    id INT NOT NULL PRIMARY KEY,
    `name` varchar(255) NOT NULL,
    phone varchar(50) NOT NULL,
    email varchar(250) NOT NULL,
    address varchar(255),
    tax_number varchar(255),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME
) ENGINE = INNODB;
CREATE TABLE go_company.employee (
    id INT NOT NULL PRIMARY KEY,
    company_id INT NOT NULL,
    `name` varchar(255) NOT NULL,
    email varchar(250) NOT NULL,
    dob DATETIME NOT NULL,
    gender varchar(50) NOT NULL,
    `role` varchar(50) NOT NULL,
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    CONSTRAINT fk_company foreign key(company_id) references go_company.company(id)
) ENGINE = INNODB;
create table project(
    id INT NOT NULL PRIMARY KEY,
    company_id INT NOT NULL,
    `name` varchar(255) NOT NULL,
    `code` varchar(255) NOT NULL,
    `status` varchar(50) NOT NULL,
    `description` varchar(255),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    CONSTRAINT fk_project_to_company foreign key (company_id) references go_company.company(id)
);
create table project(
    id INT NOT NULL PRIMARY KEY,
    company_id INT NOT NULL,
    `name` varchar(255) NOT NULL,
    `code` varchar(255) NOT NULL,
    `status` varchar(50) NOT NULL,
    `description` varchar(255),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    CONSTRAINT fk_project_to_company foreign key (company_id) references go_company.company(id)
);
create table task(
    id INT NOT NULL PRIMARY KEY,
    project_id INT NOT NULL,
    `name` varchar(255) NOT NULL,
    `status` varchar(50) NOT NULL,
    `description` varchar(255),
    created_at DATETIME,
    updated_at DATETIME,
    deleted_at DATETIME,
    CONSTRAINT fk_task_to_project foreign key (project_id) references go_company.project(id)
);
CREATE TABLE assignment (
    id INT NOT NULL PRIMARY KEY,
    project_id INT NOT NULL,
    employee_id INT NOT NULL,
    CONSTRAINT fk_project_id foreign key (project_id) references go_company.project(id),
    CONSTRAINT fk_employee_id foreign key (employee_id) references go_company.employee(id)
);