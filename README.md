# Docker image for SAP HANA 2.0, express edition

[![Build Status](https://travis-ci.org/nguoianphu/docker-hana.svg?branch=master)](https://travis-ci.org/nguoianphu/docker-hana)
[![](https://images.microbadger.com/badges/image/nguoianphu/docker-hana.svg)](http://microbadger.com/images/nguoianphu/docker-hana "Get your own image badge on microbadger.com")

## SAP HANA 2.0, express edition download manager
        https://www.sap.com/cmp/ft/crm-xu16-dat-hddedft/typ.html

Linux

        https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_linux.bin

Windows

        https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager_win.exe

Platform-independent

        https://d149oh3iywgk04.cloudfront.net/dwnldmgr/HANA2latest/HXEDownloadManager.jar


## This image use the SAP HANA 2.0, express edition

### Build

        docker build -t hana .
        
### Run
        docker run -d -p 8000:5000 -p 8001:5001 --name my-hana hana
        
        # or
        docker run -d -p 8000:5000 -p 8001:5001 --name nguoianphu-hana nguoianphu/docker-hana
