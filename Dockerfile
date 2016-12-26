# Dockerfile for SAP HANA server

FROM opensuse
# FROM openjdk:jdk-alpine

MAINTAINER Tuan Vo <vohungtuan@gmail.com>


# Install tools
RUN set -x \
 && cat /etc/os-release \
 && zypper install -y curl tar gzip openssl java-1_8_0-openjdk-devel


# Download HANA

## SAP HANA 2.0, express edition download manager
        # https://www.sap.com/cmp/ft/crm-xu16-dat-hddedft/typ.html
    # Linux        
            # https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_linux.bin
    # Windows
            # https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_win.exe
    # Platform-independent
            # https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager.jar
# RUN set -x \
 # && mkdir -p /opt/tmp/ \
 # && cd /opt/tmp/ \
 # && curl -OLS https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_linux.bin \
 # && curl -OLS https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager.jar
 


## SAP HANA 2.0, express edition Binary Installer
    # Getting Started with SAP HANA, express edition (Binary Installer Method)
            # https://d149oh3iywgk04.cloudfront.net/hanaexpress/HANA2latest/linuxx86-64/Getting_Started_HANAexpress_Binary_Installer.pdf
    # Server only installer - Server with Application Function Library
        # https://d149oh3iywgk04.cloudfront.net/hanaexpress/HANA2latest/linuxx86-64/tar/hxe.tgz
    # Applications - Applications including XSA, WebIDE, Cockit, and EA Designer
        # https://d149oh3iywgk04.cloudfront.net/hanaexpress/HANA2latest/linuxx86-64/tar/hxexsa.tgz
    # Clients - HDB and XSA clients for Linux and Windows
        # https://d149oh3iywgk04.cloudfront.net/hanaexpress/HANA2latest/linuxx86-64/common/clients.zip
RUN set -x \
 && mkdir -p /opt/tmp/ \
 && cd /opt/tmp/ \
 && curl -v  --header "x-amz-meta-description: Server only installer" -OLS https://d149oh3iywgk04.cloudfront.net/hanaexpress/HANA2latest/linuxx86-64/tar/hxe.tgz

# Install HANA

RUN set -x \
 && cd /opt/tmp/ \
 && ls -la \
 && tar zxvf hxe.tgz \
 && ls -la \
 && ls -Rla


# ENTRYPOINT ["/docker-entrypoint.sh"]

# CMD []

# EXPOSE 5000

# Remove tmp
RUN find /opt/tmp/ -type f | xargs -L1 rm -f
