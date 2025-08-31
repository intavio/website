FROM docker.io/library/node:24-alpine AS base

FROM base AS deps

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

FROM base AS builder
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .

RUN npx tailwindcss -i ./input.css -o ./output.css

# Production image, copy all the files and run next
FROM docker.io/library/nginx:latest AS runner
WORKDIR /app

COPY --from=builder /app/ /usr/share/nginx/html/
