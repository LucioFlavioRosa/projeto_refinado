import os
from pydantic import BaseSettings

class Settings(BaseSettings):
    DATABASE_URL: str = os.getenv("DATABASE_URL", "postgresql://user:password@localhost:5432/clientes_db")
    JWT_SECRET_KEY: str = os.getenv("JWT_SECRET_KEY", "troque-por-uma-chave-secreta")
    JWT_ALGORITHM: str = os.getenv("JWT_ALGORITHM", "HS256")
    FRONTEND_URL: str = os.getenv("FRONTEND_URL", "http://localhost:3000")

settings = Settings()
