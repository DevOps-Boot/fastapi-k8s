# Write python unit tests based on main.py
from fastapi.testclient import TestClient
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def read_main():
    return {"msg": "Hello World"}


client = TestClient(app)


def test_read_root():
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello World!"}
