ANSIBLE_VERSION=${1:-2.11.3}
ANSIBLE_LINT_VERSION=${2:-5.1.1}

sudo apt-get install update -y
sudo apt-get install pip3
sudo pip3 install ansible==${ANSIBLE_VERSION}
sudo pip3 install ansible-lint==${ANSIBLE_LINT_VERSION}

ansible --version
ansible-lint --version
