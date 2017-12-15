# start with alpine image
FROM alpine
# update package list and upgrade all installed packeges
RUN apk update
RUN apk upgrade
# install required packages including Ansible
###RUN apk add gcc git openssl libffi-dev musl-dev openssl-dev python-dev py2-pip
RUN apk add git openssl libffi-dev musl-dev openssl-dev python-dev py-pip ansible py-boto
##RUN apk add python openssl 
#RUN wget -O /tmp/get-pip.py https://bootstrap.pypa.io/get-pip.py
###RUN wget https://bootstrap.pypa.io/get-pip.py
#RUN python /tmp/get-pip.py
###RUN python get-pip.py
##RUN yum install -y gcc python-devel git libffi-devel openssl-devel wget
##RUN wget https://bootstrap.pypa.io/get-pip.py
##RUN python get-pip.py
##RUN pip install --no-cache-dir -U --ignore-installed "s3transfer<0.2.0,>=0.1.0" "ansible==2.2.0.0" "credstash==1.11.0" "httplib2==0.9.2" "awscli==1.10.20" "boto==2.40.0" "botocore==1.4.48" "boto3==1.4.0" "passlib==1.6.5" "pycrypto==2.6.1" "pycparser==2.13" "redis==2.10.5" "dnspython==1.14.0" "retry==0.9.2"
##RUN yum remove -y gcc* python-devel
##RUN yum clean all
##RUN hash -r
###COPY docker.cow /usr/share/cowsay/docker.cow
###COPY docker.cow /tmp/docker.cow
###COPY /usr/share/cowsay/docker.cow /tmp/docker.cow
###CMD /usr/games/fortune -a | cowsay -f /tmp/docker.cow
