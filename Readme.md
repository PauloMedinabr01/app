# Ambiente de desenvolvimento PHP, Laravel, MySQL e Nginx(em construção)

## Requisitos

### Para rodar o projeto é necessário ter instalado:

Docker e Docker Compose para rodar o ambiente de desenvolvimento.

Git para clonar o repositório do projeto.

## Instalação do ambiente de desenvolvimento

Clone o repositório do projeto:

```bash
git clone git@github.com:PauloMedinabr01/app.git
```

Entre na pasta do projeto:

```bash
cd app
```

Criar o container da aplicação. Aqui definimos o nome do container como app. Você pode alterar o nome do container se
desejar.

```bash
docker build -t app .
```

Suba o ambiente de desenvolvimento. Agora que o container foi criado, podemos subir o ambiente de desenvolvimento.
Vamos subir o container app na porta 8888 do host local.

```bash
docker run -p 8888:80 app
```

Acesse a aplicação em http://localhost:8888


