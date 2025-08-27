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
    <title>Sistema de Cadastro - Lista de Clientes</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
    <div class="container">
        <h1>Lista de Clientes Cadastrados</h1>
        
        <%
        ' Exibir mensagem se houver
        If Request.QueryString("msg") = "success" Then
            Response.Write "<div class='message message-success'>Cliente cadastrado com sucesso!</div>"
        End If
        %>
        
        <div class="nav-links">
            <a href="formulario.asp" class="btn btn-primary">Novo Cadastro</a>
        </div>
        
        <%
        ' Conectar ao banco e listar clientes
        Dim conn, rs, sql, dbPath
        Set conn = Server.CreateObject("ADODB.Connection")
        Set rs = Server.CreateObject("ADODB.Recordset")
        
        On Error Resume Next
        
        dbPath = Server.MapPath("db/cadastro.mdb")
        
        ' Verificar se o banco existe
        Dim fso
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        
        If Not fso.FileExists(dbPath) Then
            Response.Write "<div class='message message-info'>Nenhum cliente cadastrado ainda. <a href='formulario.asp'>Cadastre o primeiro cliente</a>.</div>"
        Else
            conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";"
            
            If Err.Number = 0 Then
                sql = "SELECT * FROM Clientes ORDER BY codigo"
                Set rs = conn.Execute(sql)
                
                If Not rs.EOF Then
                    Response.Write "<table class='table'>"
                    Response.Write "<thead>"
                    Response.Write "<tr>"
                    Response.Write "<th>Código</th>"
                    Response.Write "<th>Nome</th>"
                    Response.Write "<th>RG</th>"
                    Response.Write "<th>CPF</th>"
                    Response.Write "<th>Endereço</th>"
                    Response.Write "<th>CEP</th>"
                    Response.Write "</tr>"
                    Response.Write "</thead>"
                    Response.Write "<tbody>"
                    
                    Dim contador
                    contador = 0
                    
                    Do While Not rs.EOF
                        contador = contador + 1
                        Response.Write "<tr>"
                        Response.Write "<td>" & rs("codigo") & "</td>"
                        Response.Write "<td>" & Server.HTMLEncode(rs("nome")) & "</td>"
                        Response.Write "<td>" & Server.HTMLEncode(rs("rg")) & "</td>"
                        Response.Write "<td>" & Server.HTMLEncode(rs("cpf")) & "</td>"
                        Response.Write "<td>" & Server.HTMLEncode(rs("endereco")) & "</td>"
                        Response.Write "<td>" & Server.HTMLEncode(rs("cep")) & "</td>"
                        Response.Write "</tr>"
                        rs.MoveNext
                    Loop
                    
                    Response.Write "</tbody>"
                    Response.Write "</table>"
                    
                    Response.Write "<div class='message message-info'>Total de clientes cadastrados: " & contador & "</div>"
                    
                Else
                    Response.Write "<div class='message message-info'>Nenhum cliente cadastrado ainda. <a href='formulario.asp'>Cadastre o primeiro cliente</a>.</div>"
                End If
                
                rs.Close
                conn.Close
                
            Else
                Response.Write "<div class='message message-error'>Erro ao conectar com o banco de dados: " & Err.Description & "</div>"
            End If
        End If
        
        Set rs = Nothing
        Set conn = Nothing
        Set fso = Nothing
        %>
        
        <div class="nav-links">
            <a href="formulario.asp" class="btn btn-primary">Cadastrar Novo Cliente</a>
        </div>
        
        <div style="margin-top: 30px; text-align: center; color: #666; font-size: 14px;">
            <p>Sistema de Cadastro Simples - ASP Clássico</p>
        </div>
    </div>
</body>
</html>