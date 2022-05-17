-- *******************************************************************************************
-- Select all users with an organization email address
SELECT users.*
FROM "users"
         JOIN org_email_domains
              ON email like '%@' || domain_name
order by name;

-- *******************************************************************************************
-- Select all users that do not have an organization email address, ordered by last seen
SELECT users.*
FROM "users"
         LEFT JOIN org_email_domains
                   ON email like '%@' || domain_name
WHERE domain_name IS NULL
order by last_seen;

-- Export CSV version
SELECT id                                 as "Id",
       name                               as "Name",
       email                              as "Email",
       coalesce(last_seen::text, 'Never') as "Last Seen"
FROM "users"
         LEFT JOIN org_email_domains
                   ON email like '%@' || domain_name
WHERE domain_name IS NULL
order by last_seen;
