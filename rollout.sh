#!/bin/bash -ex
BUCKET_NAME=danstutzman.com

bundle exec serve export . output

aws s3 mb s3://$BUCKET_NAME
aws s3 website s3://$BUCKET_NAME --index-document index.html

cat >policy.json <<EOF
{
  "Version":"2012-10-17",
  "Statement":[{
    "Sid":"PublicReadForGetBucketObjects",
    "Effect":"Allow",
    "Principal": "*",
    "Action":["s3:GetObject"],
    "Resource":["arn:aws:s3:::danstutzman.com/*"]
  }]
}
EOF
aws s3api put-bucket-policy --bucket danstutzman.com --policy file://policy.json
rm policy.json

aws s3 sync --exclude ".*" output s3://$BUCKET_NAME

open http://$BUCKET_NAME.s3-website-us-east-1.amazonaws.com
