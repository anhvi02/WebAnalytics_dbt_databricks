-- Create development catalog
CREATE CATALOG IF NOT EXISTS webanalytics_dev
COMMENT 'Development environment for web analytics';

-- Create production catalog
CREATE CATALOG IF NOT EXISTS webanalytics_prod
COMMENT 'Production environment for web analytics';

-- Create schemas in dev
CREATE SCHEMA IF NOT EXISTS webanalytics_dev.01_bronze;
CREATE SCHEMA IF NOT EXISTS webanalytics_dev.02_silver;
CREATE SCHEMA IF NOT EXISTS webanalytics_dev.03_gold;

-- Create schemas in prod
CREATE SCHEMA IF NOT EXISTS webanalytics_prod.01_bronze;
CREATE SCHEMA IF NOT EXISTS webanalytics_prod.02_silver;
CREATE SCHEMA IF NOT EXISTS webanalytics_prod.03_gold;