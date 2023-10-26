#!/bin/bash
su 
/usr/lib/edb-as/15/bin/pg_ctl start -D /etc/edb-as/15/main
# Create a new user called cloud_user
psql -U enterprisedb postgres -c "CREATE USER dummy WITH PASSWORD 'Test123'";

# Create a schema called cloud_uat
psql -U enterprisedb postgres -c "CREATE SCHEMA cloud_platform_uat;"

GRANT ALL PRIVILEGES ON DATABASE cloud_uat TO dummy;

# Import the data from the /tmp/cloud_231013_platform.sql file into the cloud_customer_uat database
psql -U dummy -w Test123 -h localhost -d cloud_platform_uat < /tmp/cloud_231013_platform.sql