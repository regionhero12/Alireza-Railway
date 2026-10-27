#!/bin/bash

# جایگزینی متغیر $PORT در فایل تنظیمات Nginx
envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# اجرای Nginx در پس‌زمینه
nginx -g 'daemon off;' &

# اجرای پنل x-ui در پیش‌زمینه (تا کانتینر زنده بماند)
# دستور پیش‌فرض ایمیج alireza7/x-ui معمولاً خود پنل را اجرا می‌کند
# اگر نیاز به دستور خاصی بود، اینجا جایگزین کنید
/usr/local/x-ui/x-ui
