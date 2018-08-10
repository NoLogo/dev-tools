# APT & APT-Get
/usr/bin/sudo /usr/bin/add-apt-repository ppa:cpick/hub
/usr/bin/sudo /usr/bin/apt update
/usr/bin/sudo /usr/bin/apt install $(cat APTFile)
/usr/bin/sudo /usr/bin/apt-get install $(cat APTGetFile)

# Ruby
/usr/bin/sudo /usr/bin/gem install compass sass colorls

# Oh-My-ZSH
/usr/bin/curl -L http://install.ohmyz.sh | sh

# Python
/usr/bin/pip install $(cat PipFile)
