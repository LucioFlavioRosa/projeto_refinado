# Documentação de API – Sistema de Gestão de Clientes

## Endpoints Principais

### Clientes
- `POST /clientes/` – Cadastra novo cliente
- `GET /clientes/` – Lista clientes (filtros: nome, cpf)
- `GET /clientes/{id}` – Consulta cliente por ID
- `PUT /clientes/{id}` – Edita cliente
- `DELETE /clientes/{id}` – Exclui cliente

#### Exemplo de cadastro

{
  "nome": "João Silva",
  "cpf": "12345678901",
  "email": "joao@exemplo.com",
  "telefone": "11999999999",
  "data_nascimento": "1990-01-01"
}


### Autenticação
- `POST /auth/register` – Cadastro de usuário
- `POST /auth/login` – Login (retorna JWT)

#### Exemplo de login

{
  "username": "admin",
  "password": "senha123"
}


## Contrato de Resposta
- Erros retornam status HTTP e mensagem detalhada.
- JWT deve ser enviado no header Authorization: Bearer <token> para rotas protegidas.
