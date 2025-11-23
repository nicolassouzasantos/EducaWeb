## EducaWeb

✨ EducaWeb – Plataforma de Vídeos Educacionais

API RESTful + Front-end • Java + Spring Boot • Azure DevOps + PostgreSQL

🚀 Tecnologias Utilizadas

Back-end

☕ Java 21

🌱 Spring Boot

🌐 Spring Web

🗄️ Spring Data JPA

🔐 Spring Security

🎛️ Spring Validation

⚡ Spring Cache

🤖 Spring AI

📦 Maven

Banco de Dados

🐘 PostgreSQL (Azure Database for PostgreSQL Flexible Server)

Infra & DevOps

☁️ Azure App Service

📁 Azure Repos

🔄 Azure Pipelines (Build & Release – Clássico)

🔐 Branch Policies

🚀 CI/CD Automático

🌐 Deploy contínuo em merges na branch principal

Front-end

🧩 HTML5

🎨 CSS3

⚙️ JavaScript (Fetch API)

📌 Principais Funcionalidades

✔️ API RESTful completa

✔️ Cadastro de usuários

✔️ Login com autenticação

✔️ Criptografia com BCrypt

✔️ CRUD de vídeos

✔️ Paginação

✔️ Controle de acesso (rotas públicas e privadas)

✔️ Conexão com banco PostgreSQL na nuvem

✔️ Deploy automático via Azure DevOps

✔️ Validações com Bean Validation

✔️ Páginas HTML integradas ao back-end

🗂️ Estrutura da Aplicação

Controller – Rotas da API

Service – Regras de negócio

Repository – Persistência com Spring Data JPA

Model – Entidades do banco

DTO – Transferência de dados

Security – Configuração de autenticação/autorização

🔒 Segurança

Autenticação via Basic Auth

Criptografia BCrypt

Rotas protegidas e públicas via SecurityFilterChain

Proteção de endpoints sensíveis

🌐 Front-end Integrado

Páginas localizadas em src/main/resources/static:

login.html → Login de usuário

register.html → Cadastro de novos usuários

videos.html → Página protegida com listagem de vídeos

🔧 DevOps & CI/CD

CI configurado com Build clássico

Testes e validações em Pull Requests

Branch main protegida

CD configurado com Release clássico

Deploy automático no Azure App Service a cada merge aprovado

📦 Banco de Dados

Servidor: PostgreSQL Flexible Server (Azure)

Tabelas principais:

users

videos

Conexão via JDBC com SSL habilitado

📑 Endereços Importantes

/api/auth/register – Cadastro de usuários

/api/auth/login – Autenticação

/api/videos – CRUD de vídeos (autenticado)

# SCRIPTS USADOS

# Criação do banco de dados em núvem
# Passo 1:

export PREFIX="educaweb"    

export LOC="brazilsouth"          

export RG="${PREFIX}-rg"

export PGSERVER="${PREFIX}-pg"         

export PGADMIN="PGPASS"

export PGPASS="PGPASS"

export DBNAME="note"

export PLAN="${PREFIX}-plan"

export APP="${PREFIX}-app"            


# Passo 2:

az group create -n $RG -l $LOC


# Passo 3:

az postgres flexible-server create -g $RG -n $PGSERVER -l $LOC --admin-user $PGADMIN --admin-password "$PGPASS" --tier Burstable --sku-name Standard_B1ms --version 16 --yes
  
az postgres flexible-server db create -g $RG -s $PGSERVER -d $DBNAME


# Passo 4:

az postgres flexible-server firewall-rule create -g $RG -n $PGSERVER -r AllowAllAzureIPs --start-ip-address 0.0.0.0 --end-ip-address 0.0.0.0


# Passo 5:

az appservice plan create -g $RG -n $PLAN --is-linux --sku B1

az webapp create -g $RG -p $PLAN -n $APP --runtime "JAVA|17-java17"

# Para conectar ao banco no azure CLI:
FQDN=$(az postgres flexible-server show -g "$RG" -n "$PGSERVER" --query fullyQualifiedDomainName -o tsv)

psql "host=$FQDN port=5432 dbname=$DBNAME user=${PGADMIN} sslmode=require"


# Selects no banco de dados:

select * from videos;

select * from users;

# 🧪 TESTES HTTP

# Cadastro de usuários
# POST http://app-ppt-rm555571.azurewebsites.net/api/auth/register

JSON:

{
  "email": "teste6@teste6.com",
  "password": "123456"
}

# Login de usuário
# POST http://app-ppt-rm555571.azurewebsites.net/api/auth/login

JSON:

{
  "email": "teste6@teste6.com",
  "password": "123456"
}

# Adicionar vídeos
# POST http://app-ppt-rm555571.azurewebsites.net/api/videos

Auth Basic: e-mail + senhas cadastrados

JSON:

{
  "link": "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
  "descricao": "Vídeo de boas-vindas para os alunos."
}

GET (com Auth Basic):

http://app-ppt-rm555571.azurewebsites.net/api/videos?page=0&size=10

