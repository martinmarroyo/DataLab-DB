FROM postgres:15
# Set up database
ENV POSTGRES_USER=datalab
ENV POSTGRES_PASSWORD=datalab
ENV POSTGRES_DB=datalab-db
# Move data into container
COPY data /opt/data
# Load data into db
COPY data/ingest.sh /docker-entrypoint-initdb.d/
