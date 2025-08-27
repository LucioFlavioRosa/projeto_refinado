# Dockerfile para Sistema de Cadastro ASP Clássico
# Baseado em Windows Server Core com IIS

# Usar imagem base do Windows Server Core com IIS
FROM mcr.microsoft.com/windows/servercore/iis:windowsservercore-ltsc2019

# Definir diretório de trabalho
WORKDIR C:\inetpub\wwwroot

# Habilitar ASP clássico
RUN powershell -Command \
    Add-WindowsFeature Web-ASP; \
    Add-WindowsFeature Web-CGI; \
    Add-WindowsFeature Web-ISAPI-Ext; \
    Add-WindowsFeature Web-ISAPI-Filter

# Configurar IIS para ASP
RUN powershell -Command \
    Import-Module WebAdministration; \
    Set-WebConfigurationProperty -Filter '/system.webServer/asp' -Name 'enableParentPaths' -Value 'True'; \
    Set-WebConfigurationProperty -Filter '/system.webServer/asp' -Name 'scriptErrorSentToBrowser' -Value 'True'; \
    Set-WebConfigurationProperty -Filter '/system.webServer/asp/session' -Name 'allowSessionState' -Value 'True'

# Criar diretório para o banco de dados
RUN mkdir C:\inetpub\wwwroot\db

# Copiar arquivos da aplicação
COPY . C:\inetpub\wwwroot

# Configurar permissões para o diretório do banco
RUN icacls "C:\inetpub\wwwroot\db" /grant "IIS_IUSRS:(OI)(CI)F" /T
RUN icacls "C:\inetpub\wwwroot" /grant "IIS_IUSRS:(OI)(CI)R" /T

# Criar arquivo de configuração web.config para ASP
RUN echo ^<?xml version="1.0" encoding="UTF-8"?^> > web.config && \
    echo ^<configuration^> >> web.config && \
    echo   ^<system.webServer^> >> web.config && \
    echo     ^<defaultDocument^> >> web.config && \
    echo       ^<files^> >> web.config && \
    echo         ^<clear /^> >> web.config && \
    echo         ^<add value="formulario.asp" /^> >> web.config && \
    echo         ^<add value="default.asp" /^> >> web.config && \
    echo       ^</files^> >> web.config && \
    echo     ^</defaultDocument^> >> web.config && \
    echo     ^<asp^> >> web.config && \
    echo       ^<session allowSessionState="true" /^> >> web.config && \
    echo       ^<limits scriptTimeout="300" /^> >> web.config && \
    echo     ^</asp^> >> web.config && \
    echo   ^</system.webServer^> >> web.config && \
    echo ^</configuration^> >> web.config

# Expor porta 80
EXPOSE 80

# Comando para iniciar o IIS
CMD ["C:\\ServiceMonitor.exe", "w3svc"]

# Metadados do container
LABEL maintainer="Sistema de Cadastro ASP" \
      description="Container Windows com IIS e ASP clássico para sistema de cadastro" \
      version="1.0"

# Instruções de uso:
# 
# Para construir a imagem:
# docker build -t cadastro-asp .
# 
# Para executar o container:
# docker run -d -p 8080:80 --name cadastro-sistema cadastro-asp
# 
# Para acessar:
# http://localhost:8080/formulario.asp
# 
# Observações:
# - Este Dockerfile requer Docker Desktop com containers Windows
# - A imagem base é grande (~5GB) devido ao Windows Server Core
# - Para produção, considere usar Windows Server com IIS nativo
# - O banco Access será criado automaticamente no primeiro uso