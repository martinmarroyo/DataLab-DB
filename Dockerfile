FROM postgres:15
# Set up database
ENV POSTGRES_USER=datalab
ENV POSTGRES_PASSWORD=dataanalytics
ENV POSTGRES_DB=datalab-db
# Move data into container
COPY data /opt/data
# Load data into db
RUN chmod +x /opt/data/ingest.sh 
RUN echo "./opt/data/ingest.sh" >> ~/.bashrc