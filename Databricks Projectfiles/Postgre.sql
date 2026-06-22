-- Show current database
SELECT current_database();

-- Show current user
SELECT current_user;

-- Show PostgreSQL port
SHOW port;

-- Show listening addresses
SHOW listen_addresses;

-- List all tables
\dt

-- Show table structure
\d access_logs_500

-- Count records
SELECT COUNT(*) FROM access_logs_500;

-- View sample data
SELECT * FROM access_logs_500 LIMIT 10;