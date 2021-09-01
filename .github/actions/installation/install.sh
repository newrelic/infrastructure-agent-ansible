ANSIBLE_VERSION=${1:-4.5.0}
ANSIBLE_LINT_VERSION=${2:-5.1.3}
MOLECULE_VERSION=${3:-3.4.0}

sudo apt-get install update -y
sudo apt-get install pip
sudo pip install ansible-lint[community]==5.1.3
sudo pip install molecule[docker]


ansible --version
ansible-lint --version
molecule --version
