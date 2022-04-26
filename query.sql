-- SELECT Count = 6, (max count = 6)
SELECT id,
    amount_employee
FROM (
        SELECT ep.company_id as id,
            count(*) as amount_employee
        FROM employee AS ep
        GROUP BY ep.company_id
    ) as max_count
WHERE amount_employee = 6;
-- /lets-go-company
-- 1. Company API Output
-- 1.1. Get a company by ID.
-- JOIN bang it voi bang nhieu
SELECT count_employee.amount_employee AS employees,
    cp.*
FROM (
        SELECT ep.company_id as id,
            count(*) as amount_employee
        FROM employee AS ep
        WHERE ep.company_id = 109
        GROUP BY ep.company_id
    ) as count_employee
    JOIN company as cp ON cp.id = count_employee.id
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
LIMIT 0, 10