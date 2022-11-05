FROM centos:centos6

ENV PARCELDIR /opt/cloudera/parcel-repo
ENV PARCELCACHE /opt/cloudera/parcel-cache

# Environment
ENV JDK_VERSION 1.7.0_80
ENV JDK_DOWNLOAD_PATH http://download.oracle.com/otn-pub/java/jdk/7u80-b15/jdk-7u80-linux-x64.rpm
ENV JCE_POLICY_DOWNLOAD_PATH http://download.oracle.com/otn-pub/java/jce/7/UnlimitedJCEPolicyJDK7.zip

ENV CDH_VERSION 5.3.3
ENV PARCEL_DIR_DOWNLOAD http://archive.cloudera.com/cdh5/parcels/5.3.3/
ENV PARCEL_FILE_NAME CDH-5.3.3-1.cdh5.3.3.p0.5-el6.parcel

# RUN locale-gen en_US en_US.UTF-8 && dpkg-reconfigure locales
# ENV LC_ALL="en_US.UTF-8"
ENV TERM=xterm

# Update supervisord 
ADD configs/supervisord.conf /etc/

CMD supervisord