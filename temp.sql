INSERT INTO go_company.assignment (employee_id, project_id)
SELECT 999,
    7
WHERE project_id IN (
        SELECT id
        FROM go_company.project AS p
        WHERE p.`status` = 'active'
            AND p.id = 7
    );