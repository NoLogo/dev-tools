# APT & APT-Get
/usr/bin/sudo /usr/bin/add-apt-repository ppa:cpick/hub
/usr/bin/sudo /usr/bin/apt update
/usr/bin/sudo /usr/bin/apt install $(cat APTFile)
/usr/bin/sudo /usr/bin/apt-get update
/usr/bin/sudo /usr/bin/apt-get install $(cat APTGetFile)

# Ruby
/usr/bin/sudo /usr/bin/gem install compass sass colorls

# Oh My ZSH
/usr/bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Python
/usr/bin/pip install $(cat PipFile)
