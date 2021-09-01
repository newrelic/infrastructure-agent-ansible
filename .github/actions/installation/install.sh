sudo apt-get install update -y
sudo pip3 install ansible-lint[community]==5.1.3 -v
sudo pip3 install molecule[docker] -v


ansible --version
ansible-lint --version
molecule --version
