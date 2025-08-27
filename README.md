# Sistema de Cadastro Simples em ASP Clássico

Sistema básico de cadastro de clientes desenvolvido em ASP clássico (VBScript) com banco de dados Microsoft Access.

## Requisitos do Sistema

- Windows Server ou Windows com IIS habilitado
- ASP clássico habilitado no IIS
- Microsoft Access (ou drivers ODBC para Access)
- Navegador web compatível

## Instalação e Configuração

### 1. Configuração do IIS

1. Habilite o IIS no Windows
2. Ative o recurso "ASP" nas funcionalidades do IIS
3. Configure um site/aplicação apontando para a pasta do projeto
4. Certifique-se de que a extensão `.asp` está mapeada corretamente

### 2. Configuração do Banco de Dados

1. Copie o arquivo `.env.example` para `.env`
2. Ajuste o caminho do banco de dados no arquivo `.env`
3. O arquivo `db/cadastro.mdb` será criado automaticamente na primeira execução
4. Certifique-se de que o usuário do IIS tem permissões de leitura/escrita na pasta `db/`

### 3. Estrutura do Projeto


/
├── README.md              # Este arquivo
├── .gitignore            # Arquivos ignorados pelo Git
├── .env.example          # Template de configuração
├── Dockerfile            # Container para ambiente Windows
├── db/                   # Pasta do banco de dados
│   └── cadastro.mdb     # Banco Access (criado automaticamente)
├── assets/              # Recursos estáticos
│   └── style.css        # Estilos CSS
├── formulario.asp       # Página principal do formulário
├── processa_cadastro.asp # Processamento do cadastro
├── lista_clientes.asp   # Listagem de clientes
└── tests/               # Testes manuais
    └── manual_test_plan.md


## Uso do Sistema

1. Acesse `formulario.asp` no navegador
2. Preencha os campos obrigatórios:
   - **Código:** Identificador único do cliente
   - **Nome:** Nome completo
   - **RG:** Registro Geral
   - **CPF:** Formato: 000.000.000-00
   - **Endereço:** Endereço completo
   - **CEP:** Formato: 00000-000
3. Clique em "Cadastrar"
4. Visualize a lista de clientes em `lista_clientes.asp`

## Campos do Cadastro

- **codigo:** Chave primária, identificador único
- **nome:** Nome completo do cliente (obrigatório)
- **rg:** Registro Geral (obrigatório)
- **cpf:** CPF com validação de formato (obrigatório)
- **endereco:** Endereço completo (obrigatório)
- **cep:** CEP com validação de formato (obrigatório)

## Validações Implementadas

- Campos obrigatórios não podem estar vazios
- CPF deve seguir o formato 000.000.000-00
- CEP deve seguir o formato 00000-000
- Código deve ser único no banco de dados

## Solução de Problemas

### Erro de Conexão com Banco
- Verifique se o caminho do banco está correto no `.env`
- Confirme permissões de escrita na pasta `db/`
- Certifique-se de que os drivers ODBC do Access estão instalados

### Erro 500 - Internal Server Error
- Verifique se o ASP está habilitado no IIS
- Confirme se a aplicação está configurada corretamente
- Consulte os logs do IIS para detalhes do erro

## Desenvolvimento

Para modificar ou estender o sistema:

1. `formulario.asp` - Interface do usuário
2. `processa_cadastro.asp` - Lógica de negócio e validações
3. `lista_clientes.asp` - Visualização dos dados
4. `assets/style.css` - Estilos visuais

## Licença

Este projeto é fornecido como exemplo educacional.