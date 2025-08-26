# Documentação da API

## Endpoints

### Clientes
- `POST /clientes/` — Cria novo cliente
- `GET /clientes/` — Lista todos os clientes
- `GET /clientes/{id}` — Busca cliente por ID
- `PUT /clientes/{id}` — Atualiza cliente
- `DELETE /clientes/{id}` — Remove cliente

### Autenticação
- `POST /auth/login` — Login do usuário (retorna JWT)
- `POST /auth/register` — Cadastro de usuário (retorna JWT)

## Autorização
- Todos os endpoints de clientes requerem autenticação via JWT no header `Authorization: Bearer <token>`

## Esquemas de Dados
- Consulte os arquivos de schemas Pydantic para detalhes dos campos
