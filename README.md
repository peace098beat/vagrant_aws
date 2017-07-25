# Vagrant + AWS

* vagrant-aws setup
http://qiita.com/kiarina/items/052e977439c5a3693a67

* 5秒でAmazon Linuxを起動して1日で殺すRubyスクリプトを書いた
http://dev.classmethod.jp/cloud/aws/launch_in_5sec_dies_in_1day/

## .env (.gitignore)
```
AWS_SSH_KEY=${HOME}/.ssh/vagrant.pem
AWS_ACCESS_KEY_ID="A*****************A"
AWS_SECRET_ACCESS_KEY="6B0***********************6mVB"
AWS_KEYPAIR_NAME="vagrant"
AWS_SECURITY_GROUP="vagrant"
```

## aws_configure.sh (.gitignore)
```
export AWS_ACCESS_KEY_ID=*****************
export AWS_SECRET_ACCESS_KEY=K0GJ*************************7xU1Sc
export AWS_DEFAULT_REGION=ap-northeast-1
export AWS_DEFAULT_OUTPUT=text
aws configure list
# usage source aws_configure.sh
aws s3 ls

```

## vagrant.pem
```
chmod 400 ~/.ssh/vagrant.pem
```
