# Application local development environment setup


To ease daily local development and testing, the application, together with its database and proxy, can be launched and managed using Docker Compose.

Docker and Docker Compose must be installed and working on the local machine.

- **Clone repository**

  ```console
  git clone https://github.com/DevOps-Boot/fastapi-k8s.git
  ```

- **Change to dev directory**

  ```console
  cd fastapi-k8s/dev/
  ```

- **Launch the application**

  ```console
  docker compose up --build -d
  ```

  To relaunch the application as code changes, the environment must be restarted and rebuilt:
  
  ```console
  docker compose stop
  docker compose up --build -d
  ```

Once application is launched:

* The FastAPI application is available at ```http://localhost:8008```

* Traefik interface is available at ```http://localhost:8081```

* PgAdmin4 is available at ```http://localhost:8888```

To connect directly to the database CLI, use the following command:

```console
docker exec -it docker-db-1 psql -U fastapi_traefik -d fastapi_traefik
```
