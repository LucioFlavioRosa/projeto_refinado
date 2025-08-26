from sqlalchemy import Column, Integer, String, DateTime
from app.core.database import Base
import datetime

class Cliente(Base):
    __tablename__ = "clientes"

    id = Column(Integer, primary_key=True, index=True)
    nome = Column(String, nullable=False)
    email = Column(String, unique=True, nullable=False, index=True)
    cpf = Column(String(11), unique=True, nullable=False, index=True)
    criado_em = Column(DateTime, default=datetime.datetime.utcnow)
