sudo apt-get install update -y
sudo apt-get install pip
sudo pip install ansible-lint[community]==5.1.3 -v
sudo pip install molecule[docker] -v


ansible --version
ansible-lint --version
molecule --version
