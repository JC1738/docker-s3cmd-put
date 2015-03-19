# docker-s3cmd-put

docker run --env aws_key="aws_key" --env aws_secret="secret-key" --env bucket="s3://bucket/path/" --env file="/filename.txt" --env name="filename.txt" --rm=true jcastillo/docker-s3cmd-put:v1

Will upload file located at /filename.txt in the docker container into a bucket called bucket at path so final location will be s3://bucket/path/filename.txt
