-- 1. Create a connection to SQL Server with the code below (requires secrets scope) or using the UI
-- CREATE CONNECTION IF NOT EXISTS xomdata_connector
-- TYPE sqlserver
-- OPTIONS (
--   host '<your-sqlserver-hostname>',
--   port '<port>',
--   user secret('<secret-scope>', '<secret-key-user>'),
--   password secret('<secret-scope>', '<secret-key-password>')
-- );

-- 2. Create foreign catalog from the connection
CREATE FOREIGN CATALOG IF NOT EXISTS xomdata_foreign_catalog
USING CONNECTION xomdata_connector
OPTIONS (database 'xomdata_dataset')
;

-- 3. Verify
-- SHOW SCHEMAS IN xomdata_foreign_catalog;
-- SELECT  *
-- FROM xomdata_foreign_catalog.web_analytics.orders
-- LIMIT 100
-- ;