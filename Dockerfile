FROM python:3.12-slim

# Evita arquivos .pyc e ativa logs em tempo real
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

# Dependências do sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && apt-get clean

# Instala dependências Python
COPY requirements.txt .
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copia o projeto
COPY . .

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
