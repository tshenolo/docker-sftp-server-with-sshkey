# Docker SFTP Server

![Alpine Linux](https://img.shields.io/badge/Alpine_Linux-%230D597F.svg?style=for-the-badge&logo=alpine-linux&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)


This repository contains the necessary files to deploy a secure SFTP server using Docker. The setup includes volume mounting for persistent storage, key-based authentication for enhanced security, and customizable SSH configurations.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
- [Configuration](#configuration)
  - [Volume Mounting](#volume-mounting)
  - [Key-Based Authentication](#key-based-authentication)
  - [Custom SSH Configuration](#custom-ssh-configuration)
- [Building and Running](#building-and-running)
- [Conclusion](#conclusion)
- [License](#license)

## Prerequisites

Before starting, ensure you have Docker installed and running on your machine. Basic knowledge of Docker, SSH, and SFTP is also recommended.

## Quick Start

1. Clone this repository to your local machine:
```bash
git clone https://github.com/tshenolo/docker-sftp.git
cd docker-sftp
```
This Dockerfile includes comments to guide modifications such as setting the username and integrating the public SSH key. Before building your Docker image, ensure to replace placeholder values (your_user, your_public_key) with actual data. Additionally, to implement the key-based authentication securely, uncomment and modify the line that adds the public key to authorized_keys, and ensure you have the corresponding public key file (your_user.pub) available.

2. Build the Docker image:
```bash
docker build -t my-sftp-server .
```

3. Run the Docker container:
```bash
docker run -d -p 22:22 my-sftp-server
```

## Configuration
### Volume Mounting
To persist data and facilitate file management, mount a volume from the host to the container's SFTP directory:
```bash
docker run -d -p 22:22 -v /path/to/your/host/directory:/home/your_user/sftp my-sftp-server
```

### Key-Based Authentication
You can customize the sshd_config file to meet specific requirements, such as setting up chroot environments or adjusting login permissions. See the Dockerfile for examples.

### Custom SSH Configuration
You can customize the sshd_config file to meet specific requirements, such as setting up chroot environments or adjusting login permissions. See the Dockerfile for examples.

## Building and Running
After configuring, rebuild the Docker image and run the container with your adjustments. For detailed steps, refer to the sections above.

## Conclusion
This project simplifies the deployment of a secure SFTP server using Docker. By leveraging Docker's capabilities, you can ensure data persistence, enhance security, and customize configurations to suit your needs.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.





























