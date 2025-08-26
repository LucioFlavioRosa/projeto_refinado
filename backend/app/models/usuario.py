from sqlalchemy import Column, Integer, String, DateTime
from app.core.database import Base
import datetime

class Usuario(Base):
    __tablename__ = "usuarios"

    id = Column(Integer, primary_key=True, index=True)
    nome = Column(String, nullable=False)
    email = Column(String, unique=True, nullable=False, index=True)
    senha_hash = Column(String, nullable=False)
    criado_em = Column(DateTime, default=datetime.datetime.utcnow)
