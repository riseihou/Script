#!/bin/bash
#OS:CENTOS

SELFPATH=$(cd "$(dirname "$0")"; pwd)

echo "Please enter a number!"
echo "------------------------"
echo "1、install git"
echo "2、unstall_git"
echo "------------------------"
read num
case "$num" in
	[1] )
		install_git
	;;
	[2] )
		unstall_git
	;;
	*) echo "";;
esac


install_dependencies(){
    echo "installing dependencies of the software....................."
	yum -y install zlib-devel openssl-devel perl expat-devel gettext-devel curl curl-devel perl-ExtUtils-MakeMaker wget gcc gcc-c++ unzip
}

install_git(){
    install_dependencies
	unstall_git
	if [ ! -f $SELFPATH/git-2.6.0.tar.gz ];then
		wget https://www.kernel.org/pub/software/scm/git/git-2.6.0.tar.gz
	fi
	tar zxvf git-2.6.0.tar.gz
	cd git-2.6.0
	./configure --prefix=/usr/local/git
	make
	make install
	ln -s /usr/local/git/bin/* /usr/bin/
	rm -rf $SELFPATH/git-2.6.0
}

unstall_git(){
	rm -rf /usr/local/git
	rm -rf /usr/local/git/bin/git
	rm -rf /usr/local/git/bin/git-cvsserver
	rm -rf /usr/local/git/bin/gitk
	rm -rf /usr/local/git/bin/git-receive-pack
	rm -rf /usr/local/git/bin/git-shell
	rm -rf /usr/local/git/bin/git-upload-archive
	rm -rf /usr/local/git/bin/git-upload-pack
}
