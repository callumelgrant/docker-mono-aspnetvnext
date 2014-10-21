FROM    ubuntu:latest
MAINTAINER      Callum Grant <callum@callumgrant.co.nz>

RUN     apt-get -qq update

RUN     apt-get -qqy install git unzip wget curl && \
        wget http://download.mono-project.com/repo/xamarin.gpg && \
		apt-key add xamarin.gpg && \
		echo "deb http://download.mono-project.com/repo/debian wheezy main" | tee --append /etc/apt/sources.list.d/mono-xamarin.list && \
		apt-get update && \
		apt-get -qqy install mono-complete && \
		rm -rf /var/lib/apt/lists/*
RUN     mono --version

ENV     HOME  /root
RUN     mozroots --import --sync
RUN     curl https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh > /root/kvminstall.sh && \
        sh /root/kvminstall.sh && \
        /bin/bash -c "source ~/.kre/kvm/kvm.sh && kvm upgrade; echo ExitCode=$?"

RUN     git clone https://github.com/aspnet/Home.git ~/Home
RUN     /bin/bash -c "cd ~/Home && source ~/.kre/kvm/kvm.sh && kpm restore"



