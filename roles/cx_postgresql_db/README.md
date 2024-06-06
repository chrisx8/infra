# Ansible Role: `cx_postgresql_db`

This role manages PostgreSQL databases and users.

## Role variables

| Variable                    | Description                                                              | Required |
| --------------------------- | ------------------------------------------------------------------------ | -------- |
| `cx_postgresql_db_name`     | Name of the PostgreSQL database/user to be created                       | **Yes**  |
| `cx_postgresql_db_password` | Password for the PostgreSQL user, at least 8 characters.                 | **Yes**  |
| `cx_postgresql_db_state`    | State of PostgreSQL resources, `present` or `absent`. Default `present`. | No       |

## System requirements

- Linux systems with PostgreSQL installed.
- Must be able to access `postgres` user.
