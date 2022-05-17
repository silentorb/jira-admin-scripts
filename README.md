# Jira Admin SQL Scripts

Utility SQL scripts for assisting Jira administration

## Setup

1. Create a fresh Postgres database (local or remote)
2. Execute [users-schema.sql](./users-schema.sql) in that database
3. Insert any organization email domain names into the `org_email_domains` table
   1. Example: `mydomain.com`

## Usage

1. Navigate to your Jira account's users management page
2. Export a CSV of active users from
3. Execute the first section of [import-users.sql](./import-users.sql)
4. Import the CSV into the SQL database
5. Execute the third section of [import-users.sql](./import-users.sql)
6. Execute any queries on the database
   1. Common queries are included in [user-queries.sql](./user-queries.sql)