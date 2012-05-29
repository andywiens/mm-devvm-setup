curl -L get.rvm.io | sudo bash -s stable
sudo usermod -a -G rvm andy
sudo yum install -y gcc-c++ patch readline readline-devel zlib zlib-devel libyaml-devel libffi-devel openssl-devel make bzip2 autoconf automake libtool bison
source ~/.bashrc
rvm install 1.9.3