
case $EXECUTION_TYPE in
    "SCHEMA_VALIDATION")
        mysql -u $DB_USER -h $DB_HOST -p\'$DB_PASSWORD\' -D $DB_NAME < schemaValidation.sql
    ;;
    "REPLICA_READWRITE_VALIDATION")
        mysql -u $DB_USER -h $DB_HOST -p"$DB_PASSWORD" -D $DB_NAME < ValidateReadWrite.sql
    ;;
    "UPDATE_DATABASE_SCHEMA")
        mysql -u $DB_USER -h $DB_HOST -p"$DB_PASSWORD" -D $DB_NAME < update.sql
    ;;
    "PREWARM_MYSQL")
        mysql -u $DB_USER -h $DB_HOST -p"$DB_PASSWORD" -D $DB_NAME < generateprewarm.sql > generatedcommands.sql
        mysql -u $DB_USER -h $DB_HOST -p"$DB_PASSWORD" -D $DB_NAME < generatedcommands.sql > /dev/null
    ;;
esac

