import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_create_client():
    response = client.post("/clientes/", json={
        "nome": "João Silva",
        "cpf": "12345678901",
        "email": "joao@exemplo.com",
        "telefone": "11999999999",
        "data_nascimento": "1990-01-01"
    })
    assert response.status_code == 201
    assert response.json()["cpf"] == "12345678901"

def test_list_clients():
    response = client.get("/clientes/")
    assert response.status_code == 200
    assert isinstance(response.json(), list)
