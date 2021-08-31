ANSIBLE_VERSION=${1:-2.9.6}
ANSIBLE_LINT_VERSION=${2:-4.3.7}
MOLECULE_VERSION=${3:-3.2.1}

sudo apt-get install update -y
sudo apt-get install pip3
sudo pip3 install docker==19.03.12-r0
sudo pip3 install ansible==${ANSIBLE_VERSION}
sudo pip3 install ansible-lint==${ANSIBLE_LINT_VERSION}
sudo pip3 install molecule[docker]==${MOLECULE_VERSION}
sudo pip3 install flake8==3.8.4


ansible --version
ansible-lint --version
