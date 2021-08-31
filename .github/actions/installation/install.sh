VERSION=${1:-2.9.6}

sudo apt-get install update -y
sudo apt-get install pip3
sudo pip3 install ansible==${VERSION}
sudo pip3 install ansible-lint

ansible --version
ansible-lint --version
