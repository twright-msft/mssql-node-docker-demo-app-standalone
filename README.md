# mssql-node-docker-demo-app-standalone

This is a simplified version of the mssql-node-docker-demo-app.  There are three main differences:

- The original version has SQL Server embedded in it.  This version has just the app and it is designed to connect to a pre-existing SQL instance.  Therefore it is not limited to be used with the local SQL Server instance.  This version can be used with a separate SQL Server container or a SQL managed instance - Azure Arc or SQL PaaS in Azure.
- The original version uses bcp to import the data.  This version imports the data using INSERT statements in the .sql file.
- This version includes a .yaml file for deploying a pod in Kubernetes and a service.  The pod spec pulls the image from the twrightmsft registry on Docker Hub.  Feel free to use it or build your own, push it to your own registry and change the image pull spec.
  