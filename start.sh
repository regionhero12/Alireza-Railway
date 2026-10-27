#!/bin/bash

# جایگزینی متغیر $PORT در فایل تنظیمات Nginx
envsubst '${PORT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# تنظیم مسیر پایه وب برای x-ui (بسیار مهم برای کارکرد صحیح با Nginx)
/usr/local/x-ui/x-ui setting -webBasePath /managepanel/ 
# اگر می‌خواهید مسیر را تغییر دهید، فقط این خط را ویرایش کنید

# اجرای Nginx در پس‌زمینه
nginx -g 'daemon off;' &

# اجرای پنل x-ui در پیش‌زمینه
/usr/local/x-ui/x-ui
            