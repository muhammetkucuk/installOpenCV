#!/bin/sh
sudo apt-get update -y &&
sudo apt-get upgrade -y &&
sudo apt-get dist-upgrade -y &&
sudo apt-get autoremove -y &&
sudo apt-get install build-essential cmake -y &&
sudo apt-get install zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev -y &&
sudo apt-get install libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev -y && sudo apt-get install libgtk2.0-0 libgtk2.0-dev libjpeg8 libjpeg8-dev yasm -y &&
sudo apt-get install libtbb-dev libeigen3-dev -y &&
sudo apt-get install python-dev python-tk python-numpy python3-dev python3-tk python3-numpy &&
sudo apt-get install libgstreamer1.0-dev -y &&
sudo apt-get install git qt5-default -y &&
sudo apt-get install libvtk7-dev -y &&
echo "/usr/local/lib" >> opencv.conf &&
sudo mv opencv.conf /etc/ld.so.conf.d/opencv.conf &&
wget https://github.com/opencv/opencv/archive/3.4.2.tar.gz &&
tar -xvzf 3.4.2.tar.gz && 
rm 3.4.2.tar.gz &&
wget https://github.com/opencv/opencv_contrib/archive/3.4.2.tar.gz &&
tar -xvzf 3.4.2.tar.gz &&
rm 3.4.2.tar.gz &&
cd opencv-3.4.2 &&
mkdir build &&
cd build &&
cmake .. -DWITH_QT:BOOL="1" -DOPENCV_EXTRA_MODULES_PATH:PATH="../../opencv_contrib-3.4.2/modules" &&
make -j7 &&
sudo make install &&
cd ../.. &&
sudo rm -R opencv-3.4.2/ opencv_contrib-3.4.2/ &&
sudo ldconfig -v &&
sudo ldconfig
