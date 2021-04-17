sudo useradd -m frm &> /dev/null
sudo adduser frm sudo &> /dev/null  
echo 'frm:1234' | sudo chpasswd
sed -i 's/\/bin\/sh/\/bin\/bash/g' /etc/passwd
sudo su
sudo apt update
sudo apt-get install wget
sudo apt-get install unzip
sudo apt-get install xrdp
sudo apt-get install screen
sudo apt install xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg --install google-chrome-stable_current_amd64.deb
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip 
unzip ngrok-stable-linux-amd64.zip
./ngrok authtoken 1r8WTm8U9g53TuTnKlErP9UEFnh_2RhpJpBQ8PKeNiiGcZDdu
service xrdp start
screen ./ngrok tcp 3389
