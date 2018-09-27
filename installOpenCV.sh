#!/bin/sh
sudo apt-get update -y &&
sudo apt-get upgrade -y &&
sudo apt-get remove x264 libx264-dev -y &&
sudo apt-get dist-upgrade -y &&
sudo apt-get autoremove -y &&
sudo apt-get install build-essential cmake cmake-qt-gui -y &&
sudo apt-get install zlib1g-dev libjpeg-dev libwebp-dev libpng-dev libtiff5-dev libopenexr-dev libgdal-dev -y &&
sudo apt-get install libdc1394-22-dev libavcodec-dev libavformat-dev libswscale-dev libtheora-dev libvorbis-dev libxvidcore-dev libx264-dev yasm libopencore-amrnb-dev libopencore-amrwb-dev libv4l-dev libxine2-dev -y && sudo apt-get install libgtk2.0-0 libgtk2.0-dev libjpeg8 libjpeg8-dev yasm -y &&
sudo apt-get install libatlas-base-dev -y &&
sudo apt-get install libatlas-cpp-0.6-dev -y &&
sudo apt-get install libavdevice-dev libavresample-dev libass-dev libfdk-aac-dev libfreetype6-dev libmp3lame-dev libopus-dev libtheora-dev libvorbis-dev libvpx-dev libx264-dev libx265-dev -y  &&
sudo apt-get install x264 x265 v4l-utils -y &&
sudo apt-get install libprotobuf-dev protobuf-compiler -y &&
sudo apt-get install mesa-utils -y &&
sudo apt-get install freeglut3-dev -y &&
sudo apt-get install libgoogle-glog-dev libgflags-dev -y &&
sudo apt-get install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen -y &&
sudo apt-get install libtbb-dev libeigen3-dev -y &&
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libhdf5-serial-dev protobuf-compiler -y &&
sudo apt-get install python-dev python-tk python-numpy python3-dev python3-tk python3-numpy -y &&
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev -y &&
sudo apt-get install --no-install-recommends libboost-all-dev -y &&
sudo apt-get install libgstreamer1.0-dev -y &&
sudo apt-get install git gfortran qt5-default -y &&
sudo apt-get install libvtk7-dev -y &&
echo "/usr/local/lib" >> opencv.conf &&
sudo mv opencv.conf /etc/ld.so.conf.d/opencv.conf &&
wget https://github.com/opencv/opencv/archive/3.4.3.tar.gz &&
tar -xvzf 3.4.3.tar.gz &&
rm 3.4.3.tar.gz &&
wget https://github.com/opencv/opencv_contrib/archive/3.4.3.tar.gz &&
tar -xvzf 3.4.3.tar.gz &&
rm 3.4.3.tar.gz &&
cd opencv-3.4.3 &&
mkdir build &&
cd build &&
cmake .. -DCMAKE_INSTALL_PREFIX=/usr/local -DWITH_QT=ON -DWITH_V4L=ON -DWITH_OPENGL=ON -DWITH_TBB=ON -DWITH_CUDA:ON -DBUILD_opencv_cudacodec:OFF -DBUILD_CUDA_STUBS:ON -DOPENCV_EXTRA_MODULES_PATH=../../opencv_contrib-3.4.3/modules &&
make -j4 &&
sudo make install &&
cd ../.. &&
sudo rm -R opencv-3.4.3/ opencv_contrib-3.4.3/ &&
sudo ldconfig -v &&
sudo ldconfig
