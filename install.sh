#Temp set the network configs
#sudo ip addr add 192.168.178.100/24 dev eth0
#sudo ip route add default via 192.168.178.1
#nano /etc/resolv.conf

#Updating the base-image
sudo apt update
sudo apt upgrade
sudo apt install cmake

#UHD driver installation
sudo apt install libuhd-dev libuhd3.15.0 uhd-host
sudo /usr/lib/uhd/utils/uhd_images_downloader.py

## Testing USRP
sudo uhd_find_devices
sudo uhd_usrp_probe

## srsRAN installation

sudo apt install libfftw3-dev libmbedtls-dev libboost-program-options-dev libconfig++-dev libsctp-dev
git clone https://github.com/srsRAN/srsRAN.git
cd srsran
git checkout tags/release_19_12
mkdir build && cd build
cmake ../
make -j$(nproc)
sudo make install
sudo ldconfig

## copy configs to /root
sudo ./srsran_install_configs.sh user

## Test srsepc
sudo srsepc
