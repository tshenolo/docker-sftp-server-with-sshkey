# Use Alpine Linux for its small footprint and security
FROM alpine:latest

# Install OpenSSH to get the SSH and SFTP functionalities
RUN apk add --no-cache openssh

# Create the user with a home directory and no login shell
# Replace 'your_user' with the desired username
RUN adduser -D -h /home/your_user your_user -s /bin/false

# Create a directory for SFTP that the user will have access to
RUN mkdir -p /home/your_user/sftp
RUN chown your_user:your_user /home/your_user/sftp
RUN chmod 700 /home/your_user/sftp

# Change to your user to setup SSH directory and authorized_keys
USER your_user
RUN mkdir /home/your_user/.ssh
# You should replace 'your_public_key' with the actual public key text
# For example, COPY your_user.pub /home/your_user/.ssh/authorized_keys
# Make sure you add the your_user.pub file to your project
# RUN echo your_public_key > /home/your_user/.ssh/authorized_keys
USER root

# Correct permissions for .ssh and authorized_keys to ensure SSH can read them
RUN chown -R your_user:your_user /home/your_user/.ssh && chmod 700 /home/your_user/.ssh && chmod 600 /home/your_user/.ssh/authorized_keys

# Update SSH configuration to allow SFTP access and disable unnecessary features
RUN sed -i '/^Subsystem sftp/s/^/#/' /etc/ssh/sshd_config && echo 'Subsystem sftp internal-sftp' >> /etc/ssh/sshd_config

# Setup SFTP configuration
# Disabling SSH access, only SFTP is allowed
RUN echo -e '\nMatch User your_user\n\tChrootDirectory /home/your_user\n\tForceCommand internal-sftp\n\tAllowTcpForwarding no\n\tX11Forwarding no' >> /etc/ssh/sshd_config

# Generate host keys (if not provided)
RUN ssh-keygen -A

# Expose the SSH port
EXPOSE 22

# Start the SSH daemon
CMD ["/usr/sbin/sshd", "-D", "-e"]