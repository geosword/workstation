export AWS_REGION="us-east-1"
export AWS_ACCESS_KEY_ID=$(source <(grep -m1 aws_access_key_id ~/.aws/credentials | tr -d ' '); echo $aws_access_key_id)
export AWS_SECRET_ACCESS_KEY=$(source <(grep -m1 aws_secret_access_key ~/.aws/credentials | tr -d ' '); echo $aws_secret_access_key)
