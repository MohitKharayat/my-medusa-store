# Use an official Node.js runtime as a parent image
FROM node:18

# Set the working directory
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the port Medusa will run on
EXPOSE 9000
EXPOSE 7001

# Command to run the application
CMD [ "npx", "medusa", "develop" ]