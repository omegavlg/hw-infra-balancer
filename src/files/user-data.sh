#!/bin/bash

HOSTNAME=$(hostname)
LOCAL_IP=$(hostname -I | awk '{print $1}')
EXTERNAL_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

BUCKET="${bucket}"
IMAGE_URL="https://$${BUCKET}.storage.yandexcloud.net/image.jpg"

cat <<EOF > /var/www/html/index.html
<html>
  <body>
    <h1>Welcome to LAMP on Hostname: $HOSTNAME</h1>
    <p>Local IP: $LOCAL_IP</p>
    <p>External IP: $EXTERNAL_IP</p>
    <img src='$IMAGE_URL' alt='lamp-image' style='width: 50%;'>
  </body>
</html>
EOF
