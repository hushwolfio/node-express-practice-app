# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /src/backend

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application
COPY . .

# Make the entrypoint script executable
RUN chmod +x /src/entrypoint.sh

# Expose the port the app runs on
EXPOSE 3000

# Run the entrypoint script
ENTRYPOINT ["/src/entrypoint.sh"]
