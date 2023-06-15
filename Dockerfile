# Base image
FROM node:14-alpine

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm ci

# Copy the rest of the app
COPY . .

# Build the Next.js app
RUN npm run build

# Set environment variables
ENV NODE_ENV=production

# Expose the app port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
