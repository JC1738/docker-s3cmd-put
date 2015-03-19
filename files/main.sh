#!/bin/sh -x

#
# main entry point to run s3cmd put
#

#
# Check for required parameters
#
if [ -z "${aws_key}" ]; then
    echo "ERROR: The environment variable key is not set."
    exit 1
fi

if [ -z "${aws_secret}" ]; then
    echo "ERROR: The environment variable secret is not set."
    exit 1
fi

if [ -z "${bucket}" ]; then
    echo "ERROR: The bucket is not set."
    exit 1
fi

if [ -z "${file}" ]; then
    echo "ERROR: The file to upload is not set."
    exit 1
fi

if [ -z "${name}" ]; then
    echo "ERROR: The file name uploaded to is not set."
    exit 1
fi



#
# Replace key and secret in the /.s3cfg file with the one the user provided
#
echo "" >> /.s3cfg
echo "access_key=${aws_key}" >> /.s3cfg
echo "secret_key=${aws_secret}" >> /.s3cfg

echo "Starting Push"


s3cmd -c /.s3cfg put ${file} ${bucket}${name}


#
# Finished operations
#
echo "Finished s3cmd operations"
