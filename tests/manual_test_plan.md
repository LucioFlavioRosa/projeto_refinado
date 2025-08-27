# Plano de Teste Manual - Sistema de Cadastro ASP

## Pré-requisitos para Teste

- IIS configurado e funcionando
- ASP clássico habilitado
- Aplicação implantada e acessível
- Navegador web (IE, Chrome, Firefox, Edge)

## 1. Testes de Interface e Navegação

### Teste 1.1: Acesso à Página Principal
**Objetivo:** Verificar se a página do formulário carrega corretamente

**Passos:**
1. Abrir navegador
2. Acessar `http://localhost/[caminho-app]/formulario.asp`
3. Verificar se a página carrega sem erros
4. Verificar se todos os campos estão visíveis
5. Verificar se os estilos CSS estão aplicados

**Resultado Esperado:**
- Página carrega completamente
- Formulário com 6 campos visíveis
- Botões "Cadastrar" e "Limpar" funcionais
- Link para "Ver Lista de Clientes" presente

### Teste 1.2: Navegação entre Páginas
**Objetivo:** Verificar navegação entre formulário e lista

**Passos:**
1. Na página do formulário, clicar em "Ver Lista de Clientes"
2. Verificar se a página de lista carrega
3. Clicar em "Novo Cadastro" ou "Cadastrar Novo Cliente"
4. Verificar retorno ao formulário

**Resultado Esperado:**
- Navegação fluida entre páginas
- Links funcionando corretamente

## 2. Testes de Validação de Campos

### Teste 2.1: Campos Obrigatórios
**Objetivo:** Verificar validação de campos obrigatórios

**Passos:**
1. Tentar enviar formulário vazio
2. Preencher apenas alguns campos e tentar enviar
3. Verificar mensagens de erro

**Resultado Esperado:**
- Formulário não deve ser enviado com campos vazios
- Mensagens de validação devem aparecer

### Teste 2.2: Validação de CPF
**Objetivo:** Testar validação do formato de CPF

**Casos de Teste:**

| CPF Testado | Resultado Esperado |
|-------------|--------------------|
| 123.456.789-00 | Aceito |
| 12345678900 | Rejeitado (sem formatação) |
| 111.111.111-11 | Rejeitado (todos iguais) |
| 123.456.789-0 | Rejeitado (incompleto) |
| abc.def.ghi-jk | Rejeitado (não numérico) |

**Passos:**
1. Preencher campo CPF com cada valor da tabela
2. Tentar enviar formulário
3. Verificar se validação funciona corretamente

### Teste 2.3: Validação de CEP
**Objetivo:** Testar validação do formato de CEP

**Casos de Teste:**

| CEP Testado | Resultado Esperado |
|-------------|--------------------|
| 01234-567 | Aceito |
| 01234567 | Rejeitado (sem formatação) |
| 1234-567 | Rejeitado (incompleto) |
| abcde-fgh | Rejeitado (não numérico) |

### Teste 2.4: Máscaras de Input
**Objetivo:** Verificar aplicação automática de máscaras

**Passos:**
1. Digitar números no campo CPF
2. Verificar se a máscara 000.000.000-00 é aplicada automaticamente
3. Digitar números no campo CEP
4. Verificar se a máscara 00000-000 é aplicada automaticamente

## 3. Testes de Funcionalidade do Banco de Dados

### Teste 3.1: Criação Automática do Banco
**Objetivo:** Verificar se o banco é criado automaticamente

**Passos:**
1. Certificar-se de que não existe arquivo `db/cadastro.mdb`
2. Preencher formulário com dados válidos
3. Enviar formulário
4. Verificar se arquivo do banco foi criado
5. Verificar se tabela foi criada corretamente

**Resultado Esperado:**
- Arquivo `cadastro.mdb` criado na pasta `db/`
- Tabela `Clientes` criada com estrutura correta

### Teste 3.2: Inserção de Dados
**Objetivo:** Verificar inserção correta de dados

**Dados de Teste:**
- Código: 1
- Nome: João da Silva
- RG: 12.345.678-9
- CPF: 123.456.789-00
- Endereço: Rua das Flores, 123
- CEP: 01234-567

**Passos:**
1. Preencher formulário com dados de teste
2. Enviar formulário
3. Verificar mensagem de sucesso
4. Acessar lista de clientes
5. Verificar se dados foram inseridos corretamente

### Teste 3.3: Validação de Código Único
**Objetivo:** Verificar se códigos duplicados são rejeitados

**Passos:**
1. Cadastrar cliente com código 1
2. Tentar cadastrar outro cliente com código 1
3. Verificar mensagem de erro

**Resultado Esperado:**
- Segundo cadastro deve ser rejeitado
- Mensagem "Já existe um cliente com este código" deve aparecer

## 4. Testes de Listagem

### Teste 4.1: Lista Vazia
**Objetivo:** Verificar comportamento com banco vazio

**Passos:**
1. Acessar lista sem nenhum cliente cadastrado
2. Verificar mensagem informativa

**Resultado Esperado:**
- Mensagem "Nenhum cliente cadastrado ainda"
- Link para cadastrar primeiro cliente

### Teste 4.2: Lista com Dados
**Objetivo:** Verificar exibição correta dos dados

**Passos:**
1. Cadastrar alguns clientes
2. Acessar lista de clientes
3. Verificar se todos os dados estão corretos
4. Verificar ordenação por código
5. Verificar contador de registros

## 5. Testes de Tratamento de Erros

### Teste 5.1: Erro de Conexão com Banco
**Objetivo:** Verificar tratamento de erros de banco

**Passos:**
1. Remover permissões de escrita na pasta `db/`
2. Tentar cadastrar cliente
3. Verificar mensagem de erro

### Teste 5.2: Caracteres Especiais
**Objetivo:** Testar inserção de caracteres especiais

**Casos de Teste:**
- Nome com acentos: "José da Conceição"
- Endereço com aspas: "Rua "das Flores", 123"
- Caracteres especiais: "João & Maria"

## 6. Testes de Usabilidade

### Teste 6.1: Responsividade
**Objetivo:** Verificar funcionamento em diferentes tamanhos de tela

**Passos:**
1. Redimensionar janela do navegador
2. Testar em dispositivos móveis (se possível)
3. Verificar se layout se adapta corretamente

### Teste 6.2: Compatibilidade de Navegadores
**Objetivo:** Testar em diferentes navegadores

**Navegadores para Teste:**
- Internet Explorer (versões suportadas)
- Chrome
- Firefox
- Edge

## 7. Checklist Final

- [ ] Formulário carrega corretamente
- [ ] Todos os campos são obrigatórios
- [ ] Validação de CPF funciona
- [ ] Validação de CEP funciona
- [ ] Máscaras são aplicadas automaticamente
- [ ] Banco é criado automaticamente
- [ ] Dados são inseridos corretamente
- [ ] Códigos duplicados são rejeitados
- [ ] Lista exibe dados corretamente
- [ ] Navegação entre páginas funciona
- [ ] Mensagens de erro/sucesso aparecem
- [ ] Layout é responsivo
- [ ] Funciona em diferentes navegadores

## Relatório de Bugs

Use o formato abaixo para reportar problemas encontrados:

**ID do Bug:** [Número sequencial]
**Título:** [Descrição breve]
**Severidade:** [Alta/Média/Baixa]
**Passos para Reproduzir:**
1. [Passo 1]
2. [Passo 2]
3. [Passo 3]

**Resultado Esperado:** [O que deveria acontecer]
**Resultado Atual:** [O que realmente acontece]
**Navegador/Versão:** [Informações do ambiente]
**Observações:** [Informações adicionais]