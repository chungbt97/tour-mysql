-- SELECT Count = 6, (max count = 6)
SELECT id,
    amount_employee
FROM (
        SELECT ep.company_id AS id,
            count(*) AS amount_employee
        FROM employee AS ep
        GROUP BY ep.company_id
    ) AS max_count
WHERE amount_employee = 6;
-- /lets-go-company
-- 1. Company API Output
-- 1.1. Get a company by ID.
-- JOIN bang it voi bang nhieu
SELECT count_employee.amount_employee AS employees,
    cp.*
FROM (
        SELECT ep.company_id AS id,
            count(*) AS amount_employee
        FROM employee AS ep
        WHERE ep.company_id = 109
        GROUP BY ep.company_id
    ) AS count_employee
    JOIN company AS cp ON cp.id = count_employee.id
WHERE cp.id = 109;
-- 1.2. Create a company.
INSERT INTO `go_company`.`company` (
        `name`,
        `phone`,
        `email`,
        `address`,
        `tax_number`,
        `created_at`,
        `updated_at`
    )
VALUES (
        'SmartOSC',
        "987456123",
        "chungbt@smartosc.com",
        "Handio Pham Hung",
        "785412",
        now(),
        now()
    );
-- 1.3. Update a company by ID.
UPDATE `go_company`.`company`
SET `name` = 'new name',
    `phone` = 'new phone',
    `email` = 'new email',
    `address` = 'new address',
    `tax_number` = 'tax_number',
    `updated_at` = now()
WHERE `id` = 'id';
-- 1.4. Delete a company by ID.
DELETE FROM `go_company`.`company`
WHERE id = "id";
-- soft delete
UPDATE `go_company`.`company`
SET `deleted_at` = now()
WHERE `id` = 'id';
-- 1.5. List a company by page, limit and filter by "name", "phone", "email"
SELECT *
FROM `go_company`.`company` AS cp
WHERE cp.`name` LIKE '%search_value%'
    OR cp.email LIKE '%search_value%'
    OR cp.phone LIKE '%search_value%'
ORDER BY cp.created_at DESC
LIMIT 0, 100;
-- SELECT FOUND_ROWS(); Lam sao de lay dc max_page, total_count in 1 query
-- -------------------------------
-- 2. Employee API Output
-- 2.1. Get an employee by ID.
SELECT *
FROM `go_company`.`employee` AS ep
WHERE ep.id = "id";
-- 2.2. Create an employee for a specific company.
INSERT INTO `go_company`.`employee` (
        `company_id`,
        `name`,
        `email`,
        `dob`,
        `gender`,
        `role`,
        `created_at`,
        `updated_at`
    )
VALUES (
        '1',
        'ChungBT',
        "chungbt@smartosc.com",
        "1997-05-02 16:40:40",
        "Male",
        "Super Admin",
        now(),
        now()
    );
-- 2.3. Update an employee by ID.
UPDATE `go_company`.`employee`
SET `company_id` = 'new company_id',
    `name` = 'new name',
    `email` = 'new email',
    `dob` = 'new dob',
    `gender` = 'new gender',
    `role` = 'new role',
    `updated_at` = now()
WHERE id = "id";
-- 2.4. Delete an employee by ID.
DELETE FROM `go_company`.`employee`
WHERE id = "id";
-- 2.5. List employee by company id, page, limit and filter by "name", "email"
SELECT *
FROM `go_company`.`employee` AS ep
WHERE ep.`name` LIKE '%search_value%'
    OR ep.email LIKE '%search_value%'
ORDER BY ep.created_at DESC
LIMIT 0, 10;
------------------------------------------------------------
-- 1.1. Get a project by ID.
SELECT *
FROM go_company.project AS pro
WHERE pro.id = 1;
SELECT COUNT(*)
FROM go_company.tASk AS tASk
WHERE tASk.project_id = 1;
-- sub query
-- 1.1. Get a project by ID.
SELECT pro.id,
    pro.`name`,
    pro.`code`,
    count_tASk.total_tASk
FROM go_company.project AS pro
    JOIN (
        SELECT project_id,
            COUNT(*) AS total_tASk
        FROM go_company.tASk AS tASk
        WHERE tASk.project_id = 1
    ) AS count_tASk ON count_tASk.project_id = pro.id
WHERE pro.id = 1;
-- 1.2. Create a project for a specific company. Exp: company_id = 85
INSERT INTO go_company.project(
        `id`,
        `company_id`,
        `name`,
        `code`,
        `status`,
        `description`,
        `created_at`,
        `updated_at`
    )
VALUES (
        2,
        85,
        `Let's Go Docker`,
        'PIM',
        'running',
        'Zip2 wAS an online city guide software to newspapers founded by Elon and Kimbal Musk.',
        now(),
        now()
    );
-- 1.3. Update a project by ID.
UPDATE `go_company`.`project`
SET `company_id` = 'new company_id',
    `name` = 'new name',
    `code` = 'new code',
    `dob` = 'new dob',
    `status` = 'new status',
    `description` = 'new description',
    `updated_at` = now()
WHERE id = "id";
-- 1.4. Delete a project by ID.
DELETE FROM `go_company`.`project`
WHERE id = "id";
-- 1.5. List project by company id, page, limit, status and filter by "name", "code".
SELECT *
FROM `go_company`.`project` as pro
WHERE pro.company_id = 85
    AND (
        pro.`name` LIKE '%o%'
        OR pro.`code` LIKE '%o%'
    )
ORDER BY pro.created_at DESC
LIMIT 0, 10;
--
-- 1.6. Assign an employee to a project. employee_id = 999 and project_id = 7
INSERT INTO go_company.assignment (`id`, `project_id`, `employee_id`)
SELECT 1002,
    7,
    999
WHERE 7 IN (
        SELECT id
        FROM go_company.project AS p
        WHERE p.`status` = 'active'
            AND p.id = 7
    );
-- 1.7. Dismiss an employee from a project.
DELETE go_company.assignment
FROM go_company.assignment
WHERE employee_id = 999
    AND project_id = 7
    AND (
        SELECT count(*)
        FROM go_company.employee em
            INNER JOIN go_company.kanban kb ON em.id = kb.employee_id
            INNER JOIN go_company.task tk ON kb.task_id = tk.id
        WHERE em.id = 999
            AND tk.`status` = 'active'
    ) = 0;
---1.8. List employee by a specific project id
SELECT em.*
FROM go_company.employee AS em
    INNER JOIN go_company.assignment AS assi ON em.id = assi.employee_id
    INNER JOIN go_company.project AS pro ON assi.project_id = pro.id
WHERE pro.id = 7;
-- 2. Task API Output
-- 2.1. Get a task by ID.
-- 2.2. Create a task for a specific project.
-- 2.3. Update a task by ID.
-- 2.4. Delete a task by ID.
-- Tuong tu ben tren
--2.5. List task by project id, page, limit, status and filter by "name".
SELECT tk.*
FROM go_company.task AS tk
WHERE tk.project_id = 7
    OR tk.status = 'active'
    OR tk.`name` LIKE '%search_value%'
ORDER BY tk.created_at DESC
LIMIT 0, 10;
-- 2.6. Assign a task to an employee.
-- Assign Condition: task must has status of "to_do" and employee must be assigned to the task project
INSERT INTO go_company.kanban (`id`, `employee_id`, `task_id`)
SELECT 1001,
    7,
    160
WHERE 7 IN (
        SELECT assi.id
        FROM go_company.task AS tk
            RIGHT JOIN go_company.project AS pro ON tk.project_id = pro.id
            LEFT JOIN go_company.assignment AS assi ON tk.project_id = assi.project_id
        WHERE tk.`status` = 'todo'
            AND assi.employee_id = 7
    );
-- 2.7. Un-assign a task from an employee.