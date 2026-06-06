FROM hugomods/hugo:latest AS builder
COPY . /sublog
WORKDIR /sublog
RUN hugo --minify

# serve
FROM nginx:alpine
COPY --from=builder /sublog/public /usr/share/nginx/html
