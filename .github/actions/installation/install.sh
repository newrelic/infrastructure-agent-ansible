sudo pipx uninstall ansible-core
sudo pip3 install 'rich>=10.0.0,<11.0.0'
sudo pip3 install ansible-lint[community]==6.13.1
sudo pip3 install molecule[docker]==3.6.1


ansible --version
ansible-lint --version
molecule --version
