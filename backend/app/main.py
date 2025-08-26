from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api import clientes, auth

app = FastAPI(
    title="API de Gestão de Clientes",
    version="1.0.0"
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/health", tags=["Health"])
def health():
    return {"status": "ok"}

app.include_router(clientes.router, prefix="/clientes", tags=["Clientes"])
app.include_router(auth.router, prefix="/auth", tags=["Auth"])
