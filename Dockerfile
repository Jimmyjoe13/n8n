FROM node:20-alpine

WORKDIR /app

# Copy package.json and pnpm-lock.yaml
COPY package.json pnpm-lock.yaml pnpm-workspace.yaml ./

# Install pnpm
RUN npm install -g pnpm@10.2.1

# Copy the rest of the application
COPY . .

# Install dependencies
ENV DOCKER_BUILD=1
RUN pnpm install

# Build the application
RUN pnpm build

# Expose the port
EXPOSE 5678

# Set environment variables
ENV NODE_ENV=production
ENV N8N_PORT=5678
ENV N8N_PROTOCOL=https
ENV N8N_HOST=localhost

# Start the application
CMD ["pnpm", "start"]
