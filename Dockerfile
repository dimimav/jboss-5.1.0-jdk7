FROM centos:7

ARG JDK_VERSION=1.7.0
ARG ANT_VERSION=1.9.13

WORKDIR /opt

# Install wget/unzip/jdk
RUN yum -y update \
	&& yum -y install wget \
		unzip \
		java-${JDK_VERSION}-openjdk-devel \
	&& yum -y clean all

# Install Apache Ant
RUN wget http://apache.otenet.gr/dist//ant/binaries/apache-ant-1.9.13-bin.zip \
	&& unzip apache-ant-1.9.13-bin.zip \
	&& mv apache-ant-1.9.13/ /opt/ant \
	&& rm apache-ant-1.9.13-bin.zip \
	&& ln -s /opt/ant/bin/ant /usr/bin/ant

# Install jBoss 5.1.0.GA
RUN wget -O jboss.zip https://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA.zip/download \
	&& unzip jboss.zip \
	&& rm -rf jboss.zip \
	&& cd /opt/jboss-5.1.0.GA/bin \
	&& chmod +x *.sh
