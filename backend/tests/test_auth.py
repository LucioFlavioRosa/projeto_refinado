import pytest
from fastapi.testclient import TestClient
from app.main import app

client = TestClient(app)

def test_register_and_login():
    username = "testuser"
    email = "testuser@example.com"
    password = "testpassword"
    # Register
    response = client.post("/auth/register", json={
        "username": username,
        "email": email,
        "password": password
    })
    assert response.status_code == 201
    # Login
    response = client.post("/auth/login", json={
        "username": username,
        "password": password
    })
    assert response.status_code == 200
    assert "access_token" in response.json()
