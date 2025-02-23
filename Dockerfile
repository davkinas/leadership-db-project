
FROM ubuntu:20.04
RUN apt-get update && apt-get install -y sqlite3
WORKDIR /app
COPY dump.sql /app/dump.sql
RUN sqlite3 leadership.db < dump.sql
CMD ["sqlite3", "leadership.db"]
