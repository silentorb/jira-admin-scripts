-- #1 - Clear import data
truncate import_users;

-- #2 -  Import CSV to import_users
--   * No SQL needs to be manually run for this step

-- #3 - Process imported data
truncate groups_users;
truncate users;

insert into groups_users
SELECT unnest(
               string_to_array(groups, ',')
           ) AS parts,
       id
from import_users
;

insert into users
SELECT id,
       name,
       email,
       status,
       date_added,
       org_role,
       greatest(last_seen_jira, last_seen_confluence) as last_seen,
       last_seen_jira,
       last_seen_confluence
FROM (
         SELECT id,
                name,
                email,
                status,
                date_added,
                org_role,
                CASE
                    when last_seen_jira = 'Never accessed' then null
                    else to_date(last_seen_jira, 'DD Mon YYYY')
                    end
                    as last_seen_jira,
                CASE
                    when last_seen_confluence = 'Never accessed' then null
                    else to_date(last_seen_confluence, 'DD Mon YYYY')
                    end
                    as last_seen_confluence
         from import_users
     ) temp;
