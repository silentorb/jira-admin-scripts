CREATE TABLE "public"."org_email_domains"
(
    "domain_name" character varying(255) NOT NULL,
    CONSTRAINT "org_email_domains_name" PRIMARY KEY ("domain_name")
) WITH (oids = false);


CREATE TABLE "public"."groups"
(
    "name" character varying(255) NOT NULL,
    CONSTRAINT "groups_name" PRIMARY KEY ("name")
) WITH (oids = false);


CREATE TABLE "public"."groups_users"
(
    "group" character varying(255) NOT NULL,
    "user"  character varying(255) NOT NULL,
    CONSTRAINT "groups_users_group_user" PRIMARY KEY ("group", "user")
) WITH (oids = false);


CREATE TABLE "public"."import_users"
(
    "id"                   character varying(255) NOT NULL,
    "name"                 character varying(255) NOT NULL,
    "email"                character varying(255) NOT NULL,
    "status"               character varying(255) NOT NULL,
    "date_added"           date                   NOT NULL,
    "org_role"             character varying(255) NOT NULL,
    "last_seen_jira"       character varying(255) NOT NULL,
    "last_seen_confluence" character varying(255) NOT NULL,
    "groups"               character varying(255),
    CONSTRAINT "import_users_id" PRIMARY KEY ("id")
) WITH (oids = false);


CREATE TABLE "public"."users"
(
    "id"                   character varying(255) NOT NULL,
    "name"                 character varying(255) NOT NULL,
    "email"                character varying(255) NOT NULL,
    "status"               character varying(255) NOT NULL,
    "date_added"           date                   NOT NULL,
    "org_role"             character varying(255) NOT NULL,
    "last_seen"            date,
    "last_seen_jira"       date,
    "last_seen_confluence" date,
    CONSTRAINT "users_id" PRIMARY KEY ("id")
) WITH (oids = false);
