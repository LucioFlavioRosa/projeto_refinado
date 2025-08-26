import os
from pydantic import BaseSettings

class Settings(BaseSettings):
    DATABASE_URL: str = os.getenv("DATABASE_URL", "postgresql://user:password@localhost/clientes")
    JWT_SECRET: str = os.getenv("JWT_SECRET", "troque-por-um-segredo-forte")
    AZURE_STORAGE_CONNECTION_STRING: str = os.getenv("AZURE_STORAGE_CONNECTION_STRING", "")
    AZURE_APP_INSIGHTS_KEY: str = os.getenv("AZURE_APP_INSIGHTS_KEY", "")

settings = Settings()
