# Use a base image that includes the necessary tools and libraries
FROM postgres:latest

# Install necessary tools
RUN apt-get update && \
    apt-get install -y \
        python3 \
        python3-pip \
        curl \
        unzip \
        groff \
        less \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install && \
    rm -rf aws awscliv2.zip
    
WORKDIR /restore

# Copy your restore script into the container
COPY . .

# Make the script executable
RUN chmod +x restore.sh

# Specify the command to run when the container starts
CMD ["./restore.sh"]
