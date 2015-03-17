# Ruby
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo ":verbose: true\ngem: --no-ri --no-rdoc" > ~/.gemrc
/usr/bin/sudo /usr/bin/gem install compass sass

# Brew
/usr/local/bin/brew update
/usr/local/bin/brew upgrade

/usr/local/bin/brew tap $(cat TapFile)
/usr/local/bin/brew install $(cat BrewFile)
/usr/local/bin/brew cask install $(cat CaskFile)

/usr/local/bin/brew linkapps
/usr/local/bin/brew cleanup
/usr/local/bin/brew prune

# Oh-My-ZSH
/usr/bin/curl -L http://install.ohmyz.sh | sh

# Python
/usr/bin/sudo /usr/bin/easy_install pip
/usr/local/bin/pip install $(cat PipFile)
