SELECT *
FROM go_company.project;
insert into go_company.project(
        `id`,
        `company_id`,
        `name`,
        `code`,
        `status`,
        `description`,
        `created_at`,
        `updated_at`
    )
values (
        2,
        85,
        'Let\'s Go Docker',
        'PIM',
        'running',
        'Zip2 was an online city guide software to newspapers founded by Elon and Kimbal Musk.',
        now(),
        now()
    ),
    (
        3,
        100,
        'Zip2',
        'Zip2',
        'running',
        'In 1999 Elon Musk and Greg Kouri launched another project called X.com',
        now(),
        now()
    ),
    (
        4,
        85,
        'X.com',
        'X.com',
        'running',
        'SpaceX stands for Space Exploration Technologies Corporation',
        now(),
        now()
    ),
    (
        5,
        109,
        'SpaceX',
        'SpaceX',
        'running',
        'SpaceX stands for Space Exploration Technologies Corporation',
        now(),
        now()
    ),
    (
        6,
        122,
        'Tesla',
        'Tesla',
        'running',
        'In 2004, Elon Musk joined the Tesla company as its chairman. He became its CEO only in 2008',
        now(),
        now()
    ),
    (
        7,
        85,
        'The List of Elon Musk’s ProjectsSolarCity',
        'ProjectsSolarCity',
        'running',
        'SolarCity is a division of Tesla Corporation',
        now(),
        now()
    ),
    (
        8,
        100,
        'Hyperloop',
        'Hyperloop',
        'running',
        'Hyperloop is a concept of a transportation system for passengers or cargo',
        now(),
        now()
    ),
    (
        9,
        111,
        'OpenAI',
        'OpenAI',
        'running',
        'In 2015, Elon Musk founded a non-profit organization OpenAI',
        now(),
        now()
    )