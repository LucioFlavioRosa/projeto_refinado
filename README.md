# Sistema de Gestão de Clientes

Este projeto é uma solução completa para o gerenciamento de clientes de uma seguradora, composta por backend (FastAPI + PostgreSQL) e frontend (React 18 + TypeScript + Tailwind CSS), conteinerizada com Docker e preparada para deploy na Azure.

## Sumário
- [Arquitetura](#arquitetura)
- [Como rodar localmente](#como-rodar-localmente)
- [Configuração de ambiente](#configuração-de-ambiente)
- [Testes](#testes)
- [Documentação](#documentação)
- [Links úteis](#links-úteis)

## Arquitetura
- **Backend:** Python 3.11, FastAPI, SQLAlchemy, PostgreSQL, JWT Auth
- **Frontend:** React 18, TypeScript, Tailwind CSS
- **Infraestrutura:** Docker, Azure Pipelines, IaC

## Como rodar localmente
1. Clone este repositório
2. Copie `.env.example` para `.env` no backend e frontend, preenchendo as variáveis
3. Execute `docker-compose up --build` na raiz do projeto
4. Acesse o frontend em [http://localhost:3000](http://localhost:3000) e a API em [http://localhost:8000/docs](http://localhost:8000/docs)

## Configuração de ambiente
- Veja os arquivos `.env.example` em backend e frontend para variáveis necessárias (DB, JWT, Azure, API URLs)

## Testes
- Backend: `pytest backend/tests`
- Frontend: `npm test` dentro de `frontend/`

## Documentação
- [docs/api.md](docs/api.md): Endpoints da API
- [docs/frontend.md](docs/frontend.md): Guia do frontend

## Links úteis
- [FastAPI Docs](https://fastapi.tiangolo.com/)
- [React Docs](https://react.dev/)
- [Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/)
