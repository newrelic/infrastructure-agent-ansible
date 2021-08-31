ANSIBLE_VERSION=${1:-2.9.6}
ANSIBLE_LINT_VERSION=${2:-5.0.6}

sudo apt-get install update -y
sudo apt-get install pip3
sudo pip3 install ansible==${ANSIBLE_VERSION}
sudo pip3 install ansible-lint==${ANSIBLE_LINT_VERSION}

ansible --version
ansible-lint --version
