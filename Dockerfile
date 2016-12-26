# Dockerfile for SAP HANA server

FROM opensuse
# FROM openjdk:jdk-alpine

MAINTAINER Tuan Vo <vohungtuan@gmail.com>

# Download HANA

## SAP HANA 2.0, express edition download manager
        # https://www.sap.com/cmp/ft/crm-xu16-dat-hddedft/typ.html

# Linux        
        # https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_linux.bin

# Windows
        # https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_win.exe

# Platform-independent
        # https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager.jar

RUN set -x \
 && mkdir -p /opt/tmp/ \
 && cd /opt/tmp/ \
 && curl -OLS https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_linux.bin
 


# Install HANA

RUN set -x \
 && /opt/tmp/HXEDownloadManager_linux.bin


# ENTRYPOINT ["/docker-entrypoint.sh"]

# CMD []

# EXPOSE 5000

# Remove tmp
RUN find /opt/tmp/ -type f | xargs -L1 rm -f
