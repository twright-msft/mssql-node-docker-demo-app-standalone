FROM ubuntu:16.04

# Install node/npm
RUN apt-get -y update  && \
        apt-get install -y curl && \
        curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
        apt-get install -y nodejs

# Install tedious, the driver for SQL Server for Node.js
RUN npm install tedious

# Install sqlcmd
RUN curl https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
        curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | tee /etc/apt/sources.list.d/msprod.list && \
        apt-get -y update && \
        ACCEPT_EULA=Y apt-get install mssql-tools unixodbc-dev -y

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install

# Bundle app source
COPY . /usr/src/app

# Grant permissions for the import-data script to be executable
RUN chmod +x /usr/src/app/import-data.sh

EXPOSE 8080

CMD /bin/bash ./entrypoint.sh