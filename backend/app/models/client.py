from sqlalchemy import Column, Integer, String, Date
from app.db.session import Base

class Client(Base):
    __tablename__ = "clients"

    id = Column(Integer, primary_key=True, index=True)
    nome = Column(String(128), nullable=False)
    cpf = Column(String(14), unique=True, nullable=False, index=True)
    email = Column(String(128), unique=True, nullable=False)
    telefone = Column(String(20), nullable=True)
    data_nascimento = Column(Date, nullable=False)
