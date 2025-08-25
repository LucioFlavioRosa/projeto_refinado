from pydantic import BaseModel, EmailStr, constr, validator
from datetime import date
import re

class ClientBase(BaseModel):
    nome: constr(min_length=2, max_length=128)
    cpf: constr(min_length=11, max_length=14)
    email: EmailStr
    telefone: constr(min_length=8, max_length=20) = None
    data_nascimento: date

    @validator('cpf')
    def validate_cpf(cls, v):
        cpf_digits = re.sub(r'\D', '', v)
        if len(cpf_digits) != 11:
            raise ValueError('CPF deve ter 11 dígitos')
        # Adicione validação de CPF real aqui se necessário
        return v

class ClientCreate(ClientBase):
    pass

class ClientUpdate(ClientBase):
    pass

class ClientOut(ClientBase):
    id: int
    class Config:
        orm_mode = True
