<%@ Language=VBScript %>
<%
' Configurações da página
Response.ContentType = "text/html"
Response.Charset = "UTF-8"
%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sistema de Cadastro - Formulário</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div class="container">
        <h1>Sistema de Cadastro de Clientes</h1>
        
        <%
        ' Exibir mensagem se houver
        If Request.QueryString("msg") <> "" Then
            Dim msgType, msgText
            Select Case Request.QueryString("msg")
                Case "success"
                    msgType = "message-success"
                    msgText = "Cliente cadastrado com sucesso!"
                Case "error"
                    msgType = "message-error"
                    msgText = "Erro ao cadastrar cliente. Verifique os dados e tente novamente."
                Case "duplicate"
                    msgType = "message-error"
                    msgText = "Já existe um cliente com este código."
                Case "validation"
                    msgType = "message-error"
                    msgText = "Por favor, preencha todos os campos obrigatórios corretamente."
            End Select
            
            If msgText <> "" Then
                Response.Write "<div class='message " & msgType & "'>" & msgText & "</div>"
            End If
        End If
        %>
        
        <form action="processa_cadastro.asp" method="post" id="cadastroForm">
            <div class="form-group">
                <label for="codigo">Código do Cliente: *</label>
                <input type="number" id="codigo" name="codigo" required min="1" 
                       placeholder="Digite o código único do cliente">
            </div>
            
            <div class="form-group">
                <label for="nome">Nome Completo: *</label>
                <input type="text" id="nome" name="nome" required maxlength="100" 
                       placeholder="Digite o nome completo">
            </div>
            
            <div class="form-group">
                <label for="rg">RG (Registro Geral): *</label>
                <input type="text" id="rg" name="rg" required maxlength="20" 
                       placeholder="Digite o RG">
            </div>
            
            <div class="form-group">
                <label for="cpf">CPF: *</label>
                <input type="text" id="cpf" name="cpf" required maxlength="14" 
                       placeholder="000.000.000-00" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}">
            </div>
            
            <div class="form-group">
                <label for="endereco">Endereço Completo: *</label>
                <input type="text" id="endereco" name="endereco" required maxlength="200" 
                       placeholder="Digite o endereço completo">
            </div>
            
            <div class="form-group">
                <label for="cep">CEP: *</label>
                <input type="text" id="cep" name="cep" required maxlength="9" 
                       placeholder="00000-000" pattern="\d{5}-\d{3}">
            </div>
            
            <div class="form-group">
                <button type="submit" class="btn btn-primary">Cadastrar Cliente</button>
                <button type="reset" class="btn btn-secondary">Limpar Formulário</button>
            </div>
        </form>
        
        <div class="nav-links">
            <a href="lista_clientes.asp" class="btn btn-success">Ver Lista de Clientes</a>
        </div>
    </div>
    
    <script>
        // Máscaras para CPF e CEP
        document.getElementById('cpf').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length <= 11) {
                value = value.replace(/(\d{3})(\d{3})(\d{3})(\d{2})/, '$1.$2.$3-$4');
                e.target.value = value;
            }
        });
        
        document.getElementById('cep').addEventListener('input', function(e) {
            let value = e.target.value.replace(/\D/g, '');
            if (value.length <= 8) {
                value = value.replace(/(\d{5})(\d{3})/, '$1-$2');
                e.target.value = value;
            }
        });
        
        // Validação adicional no envio
        document.getElementById('cadastroForm').addEventListener('submit', function(e) {
            const cpf = document.getElementById('cpf').value;
            const cep = document.getElementById('cep').value;
            
            if (!/^\d{3}\.\d{3}\.\d{3}-\d{2}$/.test(cpf)) {
                alert('CPF deve estar no formato 000.000.000-00');
                e.preventDefault();
                return false;
            }
            
            if (!/^\d{5}-\d{3}$/.test(cep)) {
                alert('CEP deve estar no formato 00000-000');
                e.preventDefault();
                return false;
            }
        });
    </script>
</body>
</html>