from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.schemas.client import ClientCreate, ClientUpdate, ClientOut
from app.crud import client as crud_client
from app.db.session import get_db
from typing import List

router = APIRouter()

@router.post("/", response_model=ClientOut, status_code=status.HTTP_201_CREATED)
def create_client(client_in: ClientCreate, db: Session = Depends(get_db)):
    return crud_client.create_client(db, client_in)

@router.get("/", response_model=List[ClientOut])
def list_clients(skip: int = 0, limit: int = 100, nome: str = None, cpf: str = None, db: Session = Depends(get_db)):
    return crud_client.get_clients(db, skip=skip, limit=limit, nome=nome, cpf=cpf)

@router.get("/{client_id}", response_model=ClientOut)
def get_client(client_id: int, db: Session = Depends(get_db)):
    db_client = crud_client.get_client(db, client_id)
    if not db_client:
        raise HTTPException(status_code=404, detail="Cliente não encontrado")
    return db_client

@router.put("/{client_id}", response_model=ClientOut)
def update_client(client_id: int, client_in: ClientUpdate, db: Session = Depends(get_db)):
    db_client = crud_client.update_client(db, client_id, client_in)
    if not db_client:
        raise HTTPException(status_code=404, detail="Cliente não encontrado")
    return db_client

@router.delete("/{client_id}", response_model=ClientOut)
def delete_client(client_id: int, db: Session = Depends(get_db)):
    db_client = crud_client.delete_client(db, client_id)
    if not db_client:
        raise HTTPException(status_code=404, detail="Cliente não encontrado")
    return db_client
