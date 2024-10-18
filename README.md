Script autobuild freeswitch 1.10.11-release.18~64bit on centos 7

yum install -y wget
wget -O - https://raw.githubusercontent.com/kietcaodev/freeswitch_centos7/refs/heads/main/freeswitch_build.sh | sh
