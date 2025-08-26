import re

def validar_cpf(cpf: str) -> bool:
    # Validação simplificada: 11 dígitos numéricos
    return bool(re.fullmatch(r"\d{11}", cpf))

def validar_email(email: str) -> bool:
    # Validação simples de email
    return bool(re.fullmatch(r"[^@\s]+@[^@\s]+\.[^@\s]+", email))
