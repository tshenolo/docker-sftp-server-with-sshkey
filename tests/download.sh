#!/bin/bash

# Variables
SFTP_HOST='your_sftp_host'
SFTP_PORT=2222
SFTP_USER='your_user'
REMOTE_DIR='/home/your_user/sftp/upload'
LOCAL_DOWNLOAD_DIR='./download'
TEST_FILE1='test_file1.txt'
TEST_FILE2='test_file2.txt'

# Prepare download directory
echo "Preparing local download directory..."
mkdir -p "${LOCAL_DOWNLOAD_DIR}"

# Download files
echo "Downloading test files from SFTP server..."
sftp -oPort="${SFTP_PORT}" "${SFTP_USER}@${SFTP_HOST}" <<EOF
get ${REMOTE_DIR}/${TEST_FILE1} ${LOCAL_DOWNLOAD_DIR}/${TEST_FILE1}
get ${REMOTE_DIR}/${TEST_FILE2} ${LOCAL_DOWNLOAD_DIR}/${TEST_FILE2}
EOF

echo "Download complete. Test files have been downloaded from the SFTP server."
