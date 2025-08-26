from fastapi import APIRouter, Depends, HTTPException, status
from sqlalchemy.orm import Session
from app.core.database import get_db
from app.core.security import verificar_senha, criar_token_acesso, hash_senha
from app.schemas.auth import AuthLogin, AuthToken
from app.models.usuario import Usuario

router = APIRouter()

@router.post("/login", response_model=AuthToken)
def login(auth: AuthLogin, db: Session = Depends(get_db)):
    usuario = db.query(Usuario).filter(Usuario.email == auth.email).first()
    if not usuario or not verificar_senha(auth.senha, usuario.senha_hash):
        raise HTTPException(status_code=401, detail="Credenciais inválidas")
    token = criar_token_acesso({"sub": str(usuario.id)})
    return AuthToken(access_token=token)

@router.post("/register", response_model=AuthToken)
def register(auth: AuthLogin, db: Session = Depends(get_db)):
    if db.query(Usuario).filter(Usuario.email == auth.email).first():
        raise HTTPException(status_code=409, detail="Usuário já cadastrado")
    senha_hash = hash_senha(auth.senha)
    novo_usuario = Usuario(nome=auth.email.split("@")[0], email=auth.email, senha_hash=senha_hash)
    db.add(novo_usuario)
    db.commit()
    db.refresh(novo_usuario)
    token = criar_token_acesso({"sub": str(novo_usuario.id)})
    return AuthToken(access_token=token)
