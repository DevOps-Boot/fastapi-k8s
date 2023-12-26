from fastapi import FastAPI

from app.db import database, User
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(title="FastAPI, Docker, and Traefik")
instrumentator = Instrumentator().instrument(app)


@app.get("/")
async def read_root():
    return await User.objects.all()


@app.on_event("startup")
async def startup():
    # Expose prometheus metrics using the Instrumentator
    # https://github.com/trallnag/prometheus-fastapi-instrumentator
    instrumentator.expose(app)
    if not database.is_connected:
        await database.connect()
    # create a dummy entry
    await User.objects.get_or_create(email="test@test.com")


@app.on_event("shutdown")
async def shutdown():
    if database.is_connected:
        await database.disconnect()
