## To launch and relaunch in case of code change

```
docker compose up --build -d
```

## To connect to the database:

```
docker exec -it docker-db-1 psql -U fastapi_traefik -d fastapi_traefik
```

The FastAPI application is available at ```http://localhost:8008```

Traefik interface is available at ```http://localhost:8081```

PgAdmin4 is available at ```http://localhost:8888```
