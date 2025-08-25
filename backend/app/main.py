from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from app.api import client, auth
from app.core.config import settings

app = FastAPI(
    title="Sistema de Gestão de Clientes",
    version="1.0.0",
    description="API RESTful para gerenciamento de clientes de seguradora."
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=[settings.FRONTEND_URL],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/health", tags=["Health"])
def health():
    return {"status": "ok"}

app.include_router(client.router, prefix="/clientes", tags=["Clientes"])
app.include_router(auth.router, prefix="/auth", tags=["Autenticação"])
