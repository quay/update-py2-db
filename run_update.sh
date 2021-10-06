#!/bin/bash
mysql -u $DB_USER -h $DB_HOST -p$DB_PASSWORD < update.sql
