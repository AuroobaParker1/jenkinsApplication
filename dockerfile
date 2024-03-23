FROM node:14

ENV MONGODB_URI=value

# Create a directory for the application
RUN mkdir -p /home/app

# Set the working directory to /home/app
WORKDIR /home/app

# Copy the application files from the current directory into the /home/app directory in the container
COPY . .

# Install dependencies
RUN npm install

# Expose port 3000
EXPOSE 3000

# Start the application
CMD ["node", "server.js"]
