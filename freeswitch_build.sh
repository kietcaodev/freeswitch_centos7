yum update -y
yum groupinstall -y 'Development Tools'
yum install -y epel-release
yum install -y net-tools git autoconf automake libtool gcc-c++ libuuid-devel zlib-devel libjpeg-devel ncurses-devel openssl-devel sqlite-devel curl-devel pcre-devel speex-devel ldns ldns-devel libedit-devel gtk+-devel gtk2-devel yasm-devel lua-devel opus-devel e2fsprogs-devel libyuv-devel lua-devel libsndfile-devel libshout-devel lame-devel libvpx-devel opusfile libbroadvoice-dev libtiff-*
echo '[irontec]
name=Irontec RPMs repository
baseurl=http://packages.irontec.com/centos/$releasever/$basearch/' > /etc/yum.repos.d/irontec.repo
rpm --import http://packages.irontec.com/public.key
yum install sngrep -y
cd /usr/local/src/
git clone https://github.com/freeswitch/sofia-sip.git
git clone https://github.com/freeswitch/spandsp.git
cd /usr/local/src/sofia-sip
./bootstrap.sh && ./configure && make && make install
cd /usr/local/src/spandsp
./bootstrap.sh && ./configure && make && make install
cd /usr/local/src/
echo "signalwire" > /etc/yum/vars/signalwireusername
echo "pat_9GLDnLG9uxxH524XFp4nM4Wk" > /etc/yum/vars/signalwiretoken
yum install -y https://$(< /etc/yum/vars/signalwireusername):$(< /etc/yum/vars/signalwiretoken)@freeswitch.signalwire.com/repo/yum/centos-release/freeswitch-release-repo-0-1.noarch.rpm epel-release
yum install -y freeswitch-config-vanilla freeswitch-lang-* freeswitch-sounds-*
systemctl enable freeswitch
service freeswitch start
service freeswitch status
