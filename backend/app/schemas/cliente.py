from pydantic import BaseModel, EmailStr, constr
from typing import Optional

class ClienteBase(BaseModel):
    nome: str
    email: EmailStr
    cpf: constr(min_length=11, max_length=11)

class ClienteCreate(ClienteBase):
    pass

class ClienteUpdate(BaseModel):
    nome: Optional[str] = None
    email: Optional[EmailStr] = None
    cpf: Optional[constr(min_length=11, max_length=11)] = None

class ClienteOut(ClienteBase):
    id: int
    criado_em: str

    class Config:
        orm_mode = True
