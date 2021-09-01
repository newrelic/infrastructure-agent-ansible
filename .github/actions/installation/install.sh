sudo apt-get update -y
sudo apt-get remove ansible -y
sudo pip3 install ansible-lint[community]==5.1.3
sudo pip3 install molecule[docker]


ansible --version
ansible-lint --version
molecule --version
