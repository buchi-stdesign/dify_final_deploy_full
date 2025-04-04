FROM python:3.10-slim

WORKDIR /app
COPY ./backend /app
RUN pip install --no-cache-dir -r requirements.txt

COPY ./frontend/dist /usr/share/nginx/html
COPY ./frontend/nginx.conf /etc/nginx/conf.d/default.conf

RUN apt-get update && apt-get install -y nginx && apt-get clean

CMD service nginx start && gunicorn app.main:app --bind 0.0.0.0:5000
