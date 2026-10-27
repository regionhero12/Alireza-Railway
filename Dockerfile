FROM alireza0/x-ui:latest

# نصب Nginx و ابزار envsubst برای جایگزینی متغیرها
USER root
RUN apt-get update && \
    apt-get install -y nginx gettext-base && \
    rm -rf /var/lib/apt/lists/*

# کپی کردن فایل‌های تنظیمات Nginx و اسکریپت شروع
COPY nginx.conf.template /etc/nginx/nginx.conf.template
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Railway پورت را از طریق متغیر PORT تزریق می‌کند
EXPOSE 8080

CMD ["/start.sh"]
