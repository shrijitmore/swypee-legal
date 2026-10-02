# Static site, served by nginx. Cloud Run expects the container to listen
# on $PORT (defaults to 8080) — nginx's default vhost listens on 80, so it's
# rewritten to 8080 at build time rather than templated at runtime, since
# this image never needs to run anywhere else.
FROM nginx:alpine
COPY . /usr/share/nginx/html
RUN rm -f /usr/share/nginx/html/Dockerfile /usr/share/nginx/html/.gitignore \
  && sed -i 's/listen *80;/listen 8080;/' /etc/nginx/conf.d/default.conf
EXPOSE 8080
