FROM caddy:builder AS builder
RUN xcaddy build \
    --with github.com/mholt/caddy-ratelimit \
    --with github.com/caddyserver/transform-encoder \
    --with jhenson.dev/caddy-tailscale

FROM caddy:latest
COPY --from=builder /usr/bin/caddy /usr/bin/caddy
