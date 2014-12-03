export AWS_CLOUDWATCH_HOME="/usr/local/Library/LinkedKegs/cloud-watch/jars"
export AWS_IAM_HOME="/usr/local/opt/aws-iam-tools/jars"
export EC2_AMITOOL_HOME="/usr/local/Library/LinkedKegs/ec2-ami-tools/jars"
export EC2_HOME="/usr/local/Library/LinkedKegs/ec2-api-tools/jars"
export JAVA_HOME="$(/usr/libexec/java_home)"
export SERVICE_HOME="$AWS_CLOUDWATCH_HOME"
export AWS_ELB_HOME="/usr/local/Library/LinkedKegs/elb-tools/jars"

export AWS_DEFAULT_REGION=us-east-1

# export EC2_CERT="$(/bin/ls "$HOME"/.ec2/cert-*.pem | /usr/bin/head -1)"
# export EC2_PRIVATE_KEY="$(/bin/ls "$HOME"/.ec2/pk-*.pem | /usr/bin/head -1)"
#
#

if [ -r /usr/local/share/zsh/site-functions/_aws ]; then
  source /usr/local/share/zsh/site-functions/_aws
fi
