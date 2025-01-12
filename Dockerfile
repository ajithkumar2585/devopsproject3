# Use official Node.js image as base
FROM node:16

# Set working directory
WORKDIR /app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy the rest of the application
COPY . .

# Expose the app on port 99
EXPOSE 99

# Start the app
CMD ["npm", "start"]
