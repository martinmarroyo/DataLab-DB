#!/bin/bash
# A script that creates initial tables and schemas and ingests data located in /opt/data
# If schemas exist already, don't bother running
SCHEMA_CHECK="SELECT CASE WHEN EXISTS(SELECT schema_name FROM information_schema.schemata WHERE schema_name IN ('anime', 'exoplanet')) THEN 1 ELSE 0 END AS exist"
if [ $( psql -qtAX -d datalab-db -U datalab -c "${SCHEMA_CHECK}") -eq 1 ]
    then
        echo "Data already loaded. Entering shell..."
        exit 0
    else 
        echo "Database is empty. Beginning ingestion..."
fi
# Run DDL
psql -qtAX -U datalab -d datalab-db -f /opt/data/ddl/schemas.sql -f /opt/data/ddl/anime.sql -f /opt/data/ddl/exoplanet.sql
# Load data
# Anime
ANIME_TABLES=$( for file in $(ls /opt/data/*anime*.csv); do basename $file .csv; done)
for table in $ANIME_TABLES
    do
        if [ $(psql -qtAX -d datalab-db -U datalab -c "SELECT COUNT(*) FROM anime.${table} LIMIT 1") -eq 0 ]
            then
                psql -qtAX  -d datalab-db -U datalab -c "\\COPY anime.${table} FROM /opt/data/${table}.csv WITH HEADER DELIMITER ',' NULL AS '' csv"
        fi
    done
# Exoplanet
# Create tables
EXOPLANET_TABLES="dim_planet dim_star fact_planet_star raw_exoplanet"
for table in $EXOPLANET_TABLES
    do
        if [ $(psql -qtAX -d datalab-db -U datalab -c "SELECT COUNT(*) FROM exoplanet.${table} LIMIT 1") -eq 0 ]
            then
                psql -qtAX -d datalab-db -U datalab -c "\\COPY exoplanet.${table} FROM /opt/data/${table}.csv WITH HEADER DELIMITER ',' NULL AS '' csv"
        fi
    done
# Set up views and metadata
psql -qtAX -d datalab-db -U datalab -f /opt/data/metadata/anime_metadata.sql -f /opt/data/views/latest_anime_stats.sql
echo "Ingestion complete"