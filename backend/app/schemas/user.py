from pydantic import BaseModel, EmailStr, constr

class UserBase(BaseModel):
    username: constr(min_length=3, max_length=64)
    email: EmailStr

class UserCreate(UserBase):
    password: constr(min_length=6, max_length=128)

class UserLogin(BaseModel):
    username: str
    password: str

class UserOut(UserBase):
    id: int
    class Config:
        orm_mode = True
