FROM hugomods/hugo:latest AS builder
COPY . /blog
WORKDIR /blog/sublog
RUN hugo --minify

# serve
FROM nginx:alpine
COPY --from=builder /blog/sublog/public /usr/share/nginx/html
