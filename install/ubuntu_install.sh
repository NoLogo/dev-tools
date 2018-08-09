# APT & APT-Get
/usr/bin/sudo /usr/bin/add-apt-repository ppa:cpick/hub
/usr/bin/sudo /usr/bin/apt update
/usr/bin/sudo /usr/bin/apt install $(cat APTFile)
/usr/bin/sudo /usr/bin/apt-get install $(cat APTGetFile)

