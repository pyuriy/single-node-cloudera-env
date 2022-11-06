FROM intropro/single-node-cloudera-env:5.4.8

ENV PARCELDIR /opt/cloudera/parcel-repo
ENV PARCELCACHE /opt/cloudera/parcel-cache

# Environment
ENV JDK_VERSION 1.7.0_80
ENV JDK_DOWNLOAD_PATH http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm
ENV JCE_POLICY_DOWNLOAD_PATH http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip

# RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
# ENV LC_ALL="en_US.UTF-8"
ENV TERM=xterm

RUN rm -rf /etc/ssh/ssh_host*
RUN ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_key -q -N ''
RUN ssh-keygen -b 1024 -t rsa -f /etc/ssh/ssh_host_rsa_key -q -N ''
RUN ssh-keygen -b 1024 -t dsa -f /etc/ssh/ssh_host_dsa_key -q -N ''

# Update supervisord 
ADD configs/supervisord.conf /etc/

CMD supervisord