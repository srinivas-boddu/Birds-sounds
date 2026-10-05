# 🐦 Birds & Their Sounds

A beautiful, real-time web application to listen to bird calls with a modern glassmorphism UI.

## ✨ Features
- 🎨 Glassmorphism UI with animated gradient background
- 🔍 Real-time search filter
- 🎵 Play real bird sounds (audio streaming)
- 📱 Fully responsive design
- 🐳 Dockerized with Nginx
- ⚡ Multi-stage Docker build
- 🔒 Security headers + gzip compression

## 🚀 Run Locally

### Option 1: Directly open
Just open `index.html` in your browser.

### Option 2: Docker
```bash
docker build -t birds-sounds-app .
docker run -p 8080:80 birds-sounds-app
