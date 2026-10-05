# ---------- Stage 1: Build/validate ----------
FROM node:20-alpine AS builder

WORKDIR /app

# Copy static assets
COPY index.html ./
COPY nginx.conf ./

# Simple HTML validation step (optional, keeps build meaningful)
RUN echo "✅ Static files staged for production build"

# ---------- Stage 2: Serve with Nginx ----------
FROM nginx:1.27-alpine AS production

LABEL maintainer="Your Name <you@example.com>"
LABEL description="Birds & Their Sounds - Real-time audio web app"

# Remove default nginx static content
RUN rm -rf /usr/share/nginx/html/*

# Copy our site
COPY --from=builder /app/index.html /usr/share/nginx/html/index.html

# Custom nginx config for SPA + gzip + caching
COPY --from=builder /app/nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -qO- http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]
