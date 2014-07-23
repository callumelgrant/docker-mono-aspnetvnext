FROM    prozachj/docker-mono-aspnetvnext
MAINTAINER      Zachary Jones <prozachj@gmail.com>


ENTRYPOINT    /bin/bash -c "cd ~/HelloWorldVNext/src/hellomvc && source ~/.kre/kvm/kvm.sh && k start"



