sudo dnf install -y gcc ncurses-devel ctags git python python-devel \
     tcl-devel perl perl-devel perl-ExtUtils-ParseXS \
     perl-ExtUtils-XSpp perl-ExtUtils-CBuilder \
     perl-ExtUtils-Embed
# symlink xsubpp (perl) from /usr/bin to the perl dir
sudo ln -s /usr/bin/xsubpp /usr/share/perl5/ExtUtils/xsubpp
CFLAGS+="-O -fPIC -Wformat" ./configure --with-features=huge \
         --enable-multibyte \
         --enable-rubyinterp=no \
         --enable-pythoninterp=yes \
         --with-python-config-dir=/usr/lib64/python2.7/config \
         --enable-python3interp=no \
         --enable-perlinterp=no \
         --enable-luainterp=no \
         --enable-gui=no --enable-cscope --prefix=/usr
 make VIMRUNTIMEDIR=/usr/share/vim/vim74
 sudo make install
 sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 1
 sudo update-alternatives --set editor /usr/bin/vim
 sudo update-alternatives --install /usr/bin/vi vi /usr/bin/vim 1
 sudo update-alternatives --set vi /usr/bin/vim
