ANSIBLE_VERSION=${1:-2.9.6}
ANSIBLE_LINT_VERSION=${2:-4.3.7}
MOLECULE_VERSION=${3:-3.2.1}

sudo apt-get install update -y
sudo apt-get install pip
sudo pip install docker==5.0.0
sudo pip install ansible-lint==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_VERSION}
sudo pip install molecule[docker]==${MOLECULE_VERSION}
sudo pip install flake8==3.8.4


ansible --version
ansible-lint --version
molecule --version
