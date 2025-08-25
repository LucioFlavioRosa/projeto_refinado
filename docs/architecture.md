# Arquitetura – Sistema de Gestão de Clientes

## Visão Geral
- Backend: FastAPI + SQLAlchemy + PostgreSQL
- Frontend: React 18 + TypeScript + Tailwind CSS
- Autenticação JWT
- Docker Compose para orquestração

## Decisões Técnicas
- Modularização por domínio (clientes, usuários)
- Validação robusta (Pydantic, frontend)
- Testes automatizados (pytest, Jest)
- Acessibilidade WCAG 2.1
- Padrões de código: PEP 8, ESLint

## Fluxo de Autenticação
1. Usuário registra/login via `/auth` (frontend → backend)
2. Backend retorna JWT
3. Frontend armazena JWT (localStorage)
4. JWT enviado em Authorization para rotas protegidas

## Escalabilidade
- Containers independentes
- Banco persistente
- APIs <1s de resposta

## Manutenção
- Estrutura clara de pastas
- Documentação completa
- Testes automatizados
