#!/bin/bash
echo ""
echo -e "\033[32;1mInstalling gcc env ... \033[0m"
apt-get install build-essential libgtk2.0-dev
echo ""
echo -e "\033[32;1mCompiling patch ... \033[0m"
gcc -shared -o ./sublime_zh/libsublime_imfix.so ./sublime_zh/sublime_imfix.c `pkg-config --libs --cflags gtk+-2.0` -fPIC
echo ""
echo -e "\033[32;1mInstalling ... \033[0m"
mv /usr/bin/subl /usr/bin/subl_original
cp -rf ./sublime_zh /opt/sublime_text/
cp -f ./sublime_text.desktop /usr/share/applications/
cp -f ./subl /usr/bin/
chmod -R a+r /opt/sublime_text/sublime_zh
echo ""
echo -e "\033[32;1mPatching is done! \033[0m"
echo ""
