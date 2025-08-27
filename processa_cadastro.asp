<%@ Language=VBScript %>
<%
' Configurações da página
Response.ContentType = "text/html"
Response.Charset = "UTF-8"

' Função para validar CPF
Function ValidarCPF(cpf)
    Dim cpfLimpo
    cpfLimpo = Replace(Replace(cpf, ".", ""), "-", "")
    
    If Len(cpfLimpo) <> 11 Then
        ValidarCPF = False
        Exit Function
    End If
    
    ' Verificar se todos os dígitos são iguais
    Dim todosIguais, i
    todosIguais = True
    For i = 2 To Len(cpfLimpo)
        If Mid(cpfLimpo, i, 1) <> Mid(cpfLimpo, 1, 1) Then
            todosIguais = False
            Exit For
        End If
    Next
    
    If todosIguais Then
        ValidarCPF = False
        Exit Function
    End If
    
    ValidarCPF = True
End Function

' Função para validar CEP
Function ValidarCEP(cep)
    Dim cepLimpo
    cepLimpo = Replace(cep, "-", "")
    
    If Len(cepLimpo) = 8 And IsNumeric(cepLimpo) Then
        ValidarCEP = True
    Else
        ValidarCEP = False
    End If
End Function

' Função para limpar string
Function LimparString(str)
    If IsNull(str) Or str = "" Then
        LimparString = ""
    Else
        LimparString = Trim(str)
    End If
End Function

' Verificar se é POST
If Request.ServerVariables("REQUEST_METHOD") = "POST" Then
    
    ' Receber dados do formulário
    Dim codigo, nome, rg, cpf, endereco, cep
    codigo = LimparString(Request.Form("codigo"))
    nome = LimparString(Request.Form("nome"))
    rg = LimparString(Request.Form("rg"))
    cpf = LimparString(Request.Form("cpf"))
    endereco = LimparString(Request.Form("endereco"))
    cep = LimparString(Request.Form("cep"))
    
    ' Validar campos obrigatórios
    Dim erros
    erros = ""
    
    If codigo = "" Or Not IsNumeric(codigo) Then
        erros = erros & "Código é obrigatório e deve ser numérico.<br>"
    End If
    
    If nome = "" Then
        erros = erros & "Nome é obrigatório.<br>"
    End If
    
    If rg = "" Then
        erros = erros & "RG é obrigatório.<br>"
    End If
    
    If cpf = "" Then
        erros = erros & "CPF é obrigatório.<br>"
    ElseIf Not ValidarCPF(cpf) Then
        erros = erros & "CPF inválido.<br>"
    End If
    
    If endereco = "" Then
        erros = erros & "Endereço é obrigatório.<br>"
    End If
    
    If cep = "" Then
        erros = erros & "CEP é obrigatório.<br>"
    ElseIf Not ValidarCEP(cep) Then
        erros = erros & "CEP inválido.<br>"
    End If
    
    ' Se há erros, redirecionar com mensagem
    If erros <> "" Then
        Response.Redirect "formulario.asp?msg=validation"
        Response.End
    End If
    
    ' Conectar ao banco de dados
    Dim conn, rs, sql
    Set conn = Server.CreateObject("ADODB.Connection")
    Set rs = Server.CreateObject("ADODB.Recordset")
    
    On Error Resume Next
    
    ' String de conexão para Access
    Dim dbPath
    dbPath = Server.MapPath("db/cadastro.mdb")
    conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";"
    
    If Err.Number <> 0 Then
        ' Se o banco não existe, criar
        Dim fso, cat
        Set fso = Server.CreateObject("Scripting.FileSystemObject")
        
        If Not fso.FileExists(dbPath) Then
            ' Criar diretório se não existir
            If Not fso.FolderExists(Server.MapPath("db")) Then
                fso.CreateFolder(Server.MapPath("db"))
            End If
            
            ' Criar banco Access
            Set cat = Server.CreateObject("ADOX.Catalog")
            cat.Create "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";"
            Set cat = Nothing
            
            ' Reconectar
            conn.Close
            conn.Open "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & dbPath & ";"
            
            ' Criar tabela
            sql = "CREATE TABLE Clientes (" & _
                  "codigo LONG PRIMARY KEY, " & _
                  "nome TEXT(100) NOT NULL, " & _
                  "rg TEXT(20) NOT NULL, " & _
                  "cpf TEXT(14) NOT NULL, " & _
                  "endereco TEXT(200) NOT NULL, " & _
                  "cep TEXT(9) NOT NULL)"
            conn.Execute sql
        End If
    End If
    
    ' Verificar se código já existe
    sql = "SELECT COUNT(*) as total FROM Clientes WHERE codigo = " & codigo
    Set rs = conn.Execute(sql)
    
    If rs("total") > 0 Then
        conn.Close
        Set rs = Nothing
        Set conn = Nothing
        Response.Redirect "formulario.asp?msg=duplicate"
        Response.End
    End If
    
    ' Inserir registro
    sql = "INSERT INTO Clientes (codigo, nome, rg, cpf, endereco, cep) VALUES (" & _
          codigo & ", '" & Replace(nome, "'", "''") & "', '" & Replace(rg, "'", "''") & "', '" & _
          Replace(cpf, "'", "''") & "', '" & Replace(endereco, "'", "''") & "', '" & Replace(cep, "'", "''") & "')"
    
    conn.Execute sql
    
    If Err.Number = 0 Then
        conn.Close
        Set rs = Nothing
        Set conn = Nothing
        Response.Redirect "lista_clientes.asp?msg=success"
    Else
        conn.Close
        Set rs = Nothing
        Set conn = Nothing
        Response.Redirect "formulario.asp?msg=error"
    End If
    
Else
    ' Se não é POST, redirecionar para formulário
    Response.Redirect "formulario.asp"
End If
%>