#!/bin/bash

# Variables
SFTP_HOST='your_sftp_host'
SFTP_PORT=2222
SFTP_USER='your_user'
LOCAL_UPLOAD_DIR='./upload'
REMOTE_DIR='/home/your_user/sftp/upload'
TEST_FILE1='test_file1.txt'
TEST_FILE2='test_file2.txt'

# Create test files
echo "Creating test files for upload..."
mkdir -p "${LOCAL_UPLOAD_DIR}"
echo "This is a test file for inbound transfer." > "${LOCAL_UPLOAD_DIR}/${TEST_FILE1}"
echo "This is another test file for inbound transfer." > "${LOCAL_UPLOAD_DIR}/${TEST_FILE2}"

# Upload files
echo "Uploading test files to SFTP server..."
sftp -oPort="${SFTP_PORT}" "${SFTP_USER}@${SFTP_HOST}" <<EOF
put ${LOCAL_UPLOAD_DIR}/${TEST_FILE1} ${REMOTE_DIR}/${TEST_FILE1}
put ${LOCAL_UPLOAD_DIR}/${TEST_FILE2} ${REMOTE_DIR}/${TEST_FILE2}
EOF

echo "Upload complete. Test files have been transferred to the SFTP server."
