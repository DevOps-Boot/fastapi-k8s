## To launch

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

## To import data from data set

> To be executed only once as the postgres server container has a persistent volume attached to it.

```
fastapi_traefik=# \COPY gladiators (name, age, birth_year, origin, height, weight, category, wins, losses, special_skills, weapon_of_choice, patron_wealth, equipment_quality, public_favor, injury_history, mental_resilience, diet_and_nutrition, tactical_knowledge, allegiance_network, battle_experience, psychological_profile, health_status, personal_motivation, previous_occupation, training_intensity, battle_strategy, social_standing, crowd_appeal_techniques, survived) FROM '/gladiator_data.csv' DELIMITER ',' CSV HEADER;
```
