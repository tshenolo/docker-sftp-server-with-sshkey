# Use Ubuntu latest as the base image
FROM ubuntu:latest

# Avoid prompts from apt
ENV DEBIAN_FRONTEND=noninteractive

# Update packages and install OpenSSH Server and vim
RUN apt-get update && \
    apt-get install -y openssh-server vim && \
    rm -rf /var/lib/apt/lists/*

# Set up user for SFTP with no shell login
RUN useradd -m -d /home/your_user -s /usr/sbin/nologin your_user && \
    mkdir -p /home/your_user/.ssh && \
    chown your_user:your_user /home/your_user/.ssh && \
    chmod 700 /home/your_user/.ssh

# Copy the public key
# Ensure you replace 'your-ssh-public-key.pub' with your actual public key file name
COPY your-ssh-public-key.pub /home/your_user/.ssh/authorized_keys

# Set permissions for the public key
RUN chmod 600 /home/your_user/.ssh/authorized_keys && \
    chown your_user:your_user /home/your_user/.ssh/authorized_keys

# Create a directory for SFTP that the user will have access to
RUN mkdir -p /home/your_user/sftp
RUN chown root:root /home/your_user /home/your_user/sftp
RUN chmod 755 /home/your_user /home/your_user/sftp

# Configure SSH for SFTP
RUN mkdir -p /run/sshd && \
    echo "Match User your_user" >> /etc/ssh/sshd_config && \
    echo "    ChrootDirectory /home/your_user/sftp" >> /etc/ssh/sshd_config && \
    echo "    ForceCommand internal-sftp" >> /etc/ssh/sshd_config && \
    echo "    PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    echo "    PermitTunnel no" >> /etc/ssh/sshd_config && \
    echo "    AllowAgentForwarding no" >> /etc/ssh/sshd_config && \
    echo "    AllowTcpForwarding no" >> /etc/ssh/sshd_config && \
    echo "    X11Forwarding no" >> /etc/ssh/sshd_config

# Expose the SSH port
EXPOSE 22

# Run SSHD on container start
CMD ["/usr/sbin/sshd", "-D", "-e"]
