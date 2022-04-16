<?php

// Enable/Disable plugin installer (Disabled by default for security reasons)
// There is no code review or any approval process to submit a plugin.
// This is up to the Kanboard instance owner to validate if a plugin is legit.
define('PLUGIN_INSTALLER', false);

// E-mail address used for the "From" header (notifications)
define('MAIL_FROM', 'kanboard@noreply.chrisx.xyz');

// Mail transport available: "smtp", "sendmail", "mail" (PHP mail function), "postmark", "mailgun", "sendgrid"
define('MAIL_TRANSPORT', 'mail');

// Run automatically database migrations
// If set to false, you will have to run manually the SQL migrations from the CLI during the next Kanboard upgrade
// Do not run the migrations from multiple processes at the same time (example: web page + background worker)
define('DB_RUN_MIGRATIONS', true);

// Database driver: sqlite, mysql or postgres (sqlite by default)
define('DB_DRIVER', 'sqlite');

// Mysql/Postgres database name
define('DB_NAME', 'kanboard');

// Enable/disable remember me authentication
define('REMEMBER_ME_AUTH', false);

// Enable or disable "Strict-Transport-Security" HTTP header
define('ENABLE_HSTS', false);

// Enable or disable "X-Frame-Options: DENY" HTTP header
define('ENABLE_XFRAME', true);

// Escape html inside markdown text
define('MARKDOWN_ESCAPE_HTML', true);

// Enable/disable url rewrite
define('ENABLE_URL_REWRITE', true);

// Hide login form, useful if all your users use Google/Github/ReverseProxy authentication
define('HIDE_LOGIN_FORM', true);

// Disabling logout (useful for external SSO authentication)
define('DISABLE_LOGOUT', false);

// Enable captcha after 3 authentication failure
define('BRUTEFORCE_CAPTCHA', 3);

// Lock the account after 6 authentication failure
define('BRUTEFORCE_LOCKDOWN', 6);

// Lock account duration in minute
define('BRUTEFORCE_LOCKDOWN_DURATION', 60);
