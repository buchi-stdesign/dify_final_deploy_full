FROM python:3.10-slim AS backend-build
WORKDIR /app
COPY ./backend /app
RUN pip install --no-cache-dir -r requirements.txt

FROM nginx:alpine AS frontend
COPY ./frontend/dist /usr/share/nginx/html
COPY ./frontend/nginx.conf /etc/nginx/conf.d/default.conf

FROM python:3.10-slim
WORKDIR /app
COPY --from=backend-build /app /app
COPY --from=backend-build /usr/local/lib/python3.10/site-packages /usr/local/lib/python3.10/site-packages
COPY --from=frontend /usr/share/nginx/html /usr/share/nginx/html
COPY --from=frontend /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.conf
RUN apt-get update && apt-get install -y nginx && apt-get clean
CMD service nginx start && gunicorn app.main:app --bind 0.0.0.0:5000
