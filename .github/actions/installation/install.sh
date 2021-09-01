ANSIBLE_VERSION=${1:-4.5.0}
ANSIBLE_LINT_VERSION=${2:-5.1.3}
MOLECULE_VERSION=${3:-3.4.0}

sudo apt-get install update -y
sudo apt-get install pip
sudo pip install docker==5.0.0
sudo pip install ansible-lint[community]==${ANSIBLE_LINT_VERSION} ansible==${ANSIBLE_VERSION}
sudo pip install molecule[docker]==${MOLECULE_VERSION}
sudo pip install flake8==3.8.4


ansible --version
ansible-lint --version
molecule --version
