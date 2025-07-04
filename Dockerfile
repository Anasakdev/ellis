# Use uma imagem oficial do Python como imagem base
FROM python:3.13.4-alpine3.22


# Defina o diretório de trabalho no contêiner
WORKDIR /app

# Copie o arquivo de dependências para o diretório de trabalho
COPY requirements.txt .

# Instale os pacotes necessários especificados em requirements.txt
RUN pip install --no-cache-dir --upgrade pip -r requirements.txt

# Copie o resto do código da aplicação para o diretório de trabalho
COPY . .

# Exponha a porta em que o aplicativo é executado
EXPOSE 8000

# Defina o comando para executar a aplicação
CMD ["uvicorn", "app:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]