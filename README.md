# Vagrant + AWS

* vagrant-aws setup
http://qiita.com/kiarina/items/052e977439c5a3693a67

* 5秒でAmazon Linuxを起動して1日で殺すRubyスクリプトを書いた
http://dev.classmethod.jp/cloud/aws/launch_in_5sec_dies_in_1day/

## .env
```
AWS_SSH_KEY=${HOME}/.ssh/vagrant.pem
AWS_ACCESS_KEY_ID="A*****************A"
AWS_SECRET_ACCESS_KEY="6B0***********************6mVB"
AWS_KEYPAIR_NAME="vagrant"
AWS_SECURITY_GROUP="vagrant"
```

## vagrant.pem
```
chmod 400 ~/.ssh/vagrant.pem
```
