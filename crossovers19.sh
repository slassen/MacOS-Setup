# WIP script to build and install crossovers 19

brew install mingw-w64 freetype bison flex pkg-config winetricks libjpeg
brew cask install xquartz
export PATH=/usr/local/Cellar/bison/<version>/bin:$PATH

cd $HOME/Desktop
mkdir crossovers
cd crossovers
curl -o source.tar.gz https://media.codeweavers.com/pub/crossover/source/crossover-sources-19.0.2.tar.gz
tar -xz source.tar.gz
cd sources/llvm
mkdir build
cd build
cmake ../
make
cd bin
export PATH="$(pwd):$PATH"
cd ../../../clang
mkdir build
cd build
cmake ../
make
cd bin
export PATH="$(pwd):$PATH"
cd ../../../wine

cat <<'EOF' > include/distversion.h
/* ---------------------------------------------------------------
 *   distversion.c
 *
 * Copyright 2013, CodeWeavers, Inc.
 * 
 * Information from DISTVERSION which needs to find 
 * its way into the wine tree.
 * --------------------------------------------------------------- */

#define WINDEBUG_WHAT_HAPPENED_MESSAGE "This can be caused by a problem in the program or a deficiency in Wine. You may want to check <a href=\"http://www.codeweavers.com/compatibility/\">http://www.codeweavers.com/compatibility/</a> for tips about running this application."

#define WINDEBUG_USER_SUGGESTION_MESSAGE "If this problem is not present under Windows and has not been reported yet, you can save the detailed information to a file using the \"Save As\" button, then <a href=\"http://www.codeweavers.com/support/tickets/enter/\">file a bug report</a> and attach that file to the report."

EOF

CC="clang" CXX="clang++" MACOSX_DEPLOYMENT_TARGET=10.14 ./configure --enable-win32on64 --disable-winedbg --without-x --without-vulkan --disable-mscms --with-mingw
make -s -j4
sudo make install
