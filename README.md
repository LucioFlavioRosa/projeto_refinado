# Sistema de Gestão de Clientes

Este projeto é composto por um backend em FastAPI (Python) e um frontend em React 18 com TypeScript e Tailwind CSS. Ele permite o gerenciamento seguro de clientes de uma seguradora, incluindo autenticação JWT, persistência em PostgreSQL e interface responsiva e acessível.

## Componentes
- **Backend**: API RESTful em FastAPI, autenticação JWT, integração PostgreSQL, testes automatizados (pytest).
- **Frontend**: SPA em React 18 + TypeScript + Tailwind CSS, integração com backend, validação de dados, acessibilidade WCAG 2.1, testes automatizados (Jest/Testing Library).
- **Docker**: Orquestração via Docker Compose para ambiente de desenvolvimento e produção.
- **Documentação**: Diagramas, contratos de API, padrões de código e manual de deploy.

## Como iniciar
1. Clone o repositório:
   bash
   git clone <url-do-repo>
   cd sistema-gestao-clientes
   
2. Configure as variáveis de ambiente:
   - Copie `.env.example` para `.env` e ajuste conforme necessário.
3. Suba os containers:
   bash
   docker-compose up --build
   
4. Acesse:
   - Backend: `http://localhost:8000/docs`
   - Frontend: `http://localhost:3000`

## Estrutura de Pastas
- `backend/`: API FastAPI
- `frontend/`: SPA React
- `docs/`: Documentação técnica

## Testes
- Backend: `pytest backend/tests/`
- Frontend: `npm test` na pasta `frontend/`

## Contribuição
Siga os padrões de código (PEP 8, ESLint) e envie PRs com testes automatizados.

## Licença
MIT
