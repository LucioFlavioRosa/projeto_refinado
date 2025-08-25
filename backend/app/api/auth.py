from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.schemas.user import UserCreate, UserLogin, UserOut
from app.crud import user as crud_user
from app.core.security import create_access_token
from app.db.session import get_db

router = APIRouter()

@router.post("/register", response_model=UserOut, status_code=status.HTTP_201_CREATED)
def register(user_in: UserCreate, db: Session = Depends(get_db)):
    if crud_user.get_user_by_username(db, user_in.username):
        raise HTTPException(status_code=400, detail="Usuário já existe")
    if crud_user.get_user_by_email(db, user_in.email):
        raise HTTPException(status_code=400, detail="Email já cadastrado")
    return crud_user.create_user(db, user_in)

@router.post("/login")
def login(user_in: UserLogin, db: Session = Depends(get_db)):
    user = crud_user.authenticate_user(db, user_in.username, user_in.password)
    if not user:
        raise HTTPException(status_code=401, detail="Credenciais inválidas")
    access_token = create_access_token(data={"sub": user.username})
    return {"access_token": access_token, "token_type": "bearer"}
