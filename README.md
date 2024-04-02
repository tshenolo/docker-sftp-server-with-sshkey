# Docker SFTP Server

![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Docker](https://img.shields.io/badge/docker-%230db7ed.svg?style=for-the-badge&logo=docker&logoColor=white)


This repository contains the necessary files to deploy a secure SFTP server using Docker. The setup includes volume mounting for persistent storage, key-based authentication for enhanced security, and customizable SSH configurations.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Quick Start](#quick-start)
	- [SSH Key Configuration](#ssh-key-configuration)  
	- [Clone this repository](#clone-this-repository) 
	- [Build the Docker image](#build-the-docker-image) 
	- [Run the Docker container](#run-the-dockrer-container)
  - [Connecting to the SFTP Server](#connecting-to-the-sftp-server)   
- [Conclusion](#conclusion) 
- [License](#license)

## 🎬 Video demonstration
[![IMAGE ALT TEXT HERE](https://img.youtube.com/vi/NpEaa2P7qZI/0.jpg)](https://www.youtube.com/watch?v=NpEaa2P7qZI)

## Prerequisites

Before starting, ensure you have Docker installed and running on your machine. Basic knowledge of Docker, SSH, and SFTP is also recommended.

## Quick Start
### SSH Key Configuration  
Generate SSH Key: If you do not already have an SSH key pair, you can generate one using the following command:
```bash
ssh-keygen -t rsa -b 4096 -C "your_email@example.com" -f $HOME/.ssh/id_rsa
```

Ensure your private key (~/.ssh/id_rsa) is kept secure with the appropriate permissions:
```bash
chmod 600 ~/.ssh/id_rsa
```

Load your SSH key into the SSH agent by running:
```bash
ssh-add ~/.ssh/id_rsa
```

### Clone this repository:
```bash
git clone https://github.com/tshenolo/docker-sftp.git
```

Change your current working directory to the newly cloned repository:
```bash
cd docker-sftp
```

To ensure SSH key-based authentication for your SFTP server, place your SSH public key into the working directory:
```bash
cp $HOME/.ssh/id_rsa.pub .
```


### Build the Docker image:
```bash
docker build -t my-sftp-server .
```

### Run the Docker container:  
To run your SFTP server container without data persistence, you might use a command like this:
```bash
docker run -d --name my_sftp_container -p 2222:22 your_sftp_server
```

To ensure that uploaded files are not lost when the container stops or is removed, you should persist data by mapping a directory from your host machine to a directory inside the container
```bash
docker run -d -v /local/sftp/upload:/home/your_user/sftp/upload --name my_sftp_container -p 2222:22 your_sftp_server
```

### Connecting to the SFTP Server
Connect to your SFTP server using:
```bash
sftp -oPort=2222 your_user@0.0.0.0
```

## Conclusion
This project simplifies the deployment of a secure SFTP server using Docker. By leveraging Docker's capabilities, you can ensure data persistence, enhance security, and customize configurations to suit your needs.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Thank you for the Support
- ⭐ Give this repo a ⭐ star ⭐ at the top of the page
- 🐦 Follow me on [X](https://twitter.com/tshenolo)
- 📺 Subscribe to my [Youtube channel](https://www.youtube.com/@tshenolo?sub_confirmation=1)





























