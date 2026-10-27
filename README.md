# 🚀 X-UI on Railway (Alireza-Railway)

<div align="center">

![GitHub stars](https://img.shields.io/github/stars/Regionhero12/Alireza-Railway?style=for-the-badge&logo=github&color=yellow)
![GitHub forks](https://img.shields.io/github/forks/Regionhero12/Alireza-Railway?style=for-the-badge&logo=github&color=blue)
![GitHub license](https://img.shields.io/github/license/Regionhero12/Alireza-Railway?style=for-the-badge&color=green)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)
![Railway](https://img.shields.io/badge/Railway-0B0D0E?style=for-the-badge&logo=railway&logoColor=white)

**نسخه‌ی آماده‌ی استقرار پنل X-UI روی Railway با Nginx Reverse Proxy**

[🚀 استقرار سریع](#-استقرار-روی-railway) • [📖 مستندات](#-درباره-پروژه) • [🐛 گزارش خطا](https://github.com/Regionhero12/Alireza-Railway/issues)

</div>

---

> ⚠️ **توجه**: این پروژه برای استفاده‌ی شخصی و آموزشی طراحی شده است. لطفاً از آن برای اهداف غیرقانونی استفاده نکنید.

---

## 📖 درباره پروژه

این ریپازیتوری یک نسخه‌ی آماده‌ی استقرار از پنل **X-UI** است که برای اجرا روی پلتفرم **Railway** سازگار شده است. با استفاده از **Nginx** به عنوان Reverse Proxy، پنل مدیریت و اینباندهای Xray از طریق **یک پورت واحد** (که Railway در اختیار شما قرار می‌دهد) در دسترس خواهند بود.

این پروژه بر پایه‌ی [alireza0/x-ui](https://github.com/alireza0/x-ui) ساخته شده و تمام امکانات آن را در محیط محدود Railway (بدون دسترسی کرنل) فراهم می‌کند.

---

## ✨ امکانات

| ویژگی | وضعیت |
| :--- | :---: |
| پنل مدیریت وب کامل | ✅ |
| پشتیبانی از VLESS / VMess / Trojan / Shadowsocks | ✅ |
| پشتیبانی از XTLS (Vision و REALITY) | ✅ |
| مدیریت کاربران با محدودیت حجم و تاریخ انقضا | ✅ |
| سرویس اشتراک (Subscription) | ✅ |
| ربات تلگرام | ✅ |
| API کامل با مستندات OpenAPI 3.0 | ✅ |
| رابط کاربری چندزبانه (فارسی، انگلیسی، چینی و…) | ✅ |
| پشتیبانی از Cloudflare WARP | ✅ |
| محدودیت IP (بر پایه nftables) | ⚠️ |
| WireGuard کرنل | ❌ |

---

## 🧱 معماری

<div align="center">

![Architecture](https://via.placeholder.com/800x300/0B0D0E/FFFFFF?text=Internet+%E2%86%92+Railway+Port+%E2%86%92+Nginx+%E2%86%92+Panel+%2B+Inbound)

</div>

---

## 🚀 استقرار روی Railway

### گام ۱: فورک کردن ریپازیتوری
این ریپازیتوری را در حساب گیت‌هاب خود فورک کنید.

### گام ۲: ساخت پروژه در Railway
1. وارد [Railway](https://railway.app) شوید.
2. روی **New Project** کلیک کنید.
3. گزینه **Deploy from GitHub repo** را انتخاب کنید.
4. ریپازیتوری `Regionhero12/Alireza-Railway` را انتخاب کنید.
5. Railway به‌طور خودکار `Dockerfile` را تشخیص داده و بیلد می‌کند.

### گام ۳: تنظیم دامنه
1. به **Settings → Networking** بروید.
2. روی **Generate Domain** کلیک کنید.
3. دامنه‌ی تولیدشده را کپی کنید.

### گام ۴: اتصال Volume (بسیار مهم!)
1. به بخش **Volumes** بروید.
2. یک Volume جدید بسازید.
3. آن را به مسیر **`/etc/x-ui`** متصل کنید.

### گام ۵: ورود به پنل
به آدرس زیر بروید:


https://<your-domain>.up.railway.app/managepanel/


- **نام کاربری پیش‌فرض**: `admin`
- **رمز عبور پیش‌فرض**: `admin`

> 🔐 **حتماً پس از اولین ورود، نام کاربری و رمز عبور را تغییر دهید!**

---

## ⚙️ پیکربندی اینباند VLESS

پس از ورود به پنل:

1. به بخش **Inbounds** بروید و روی **+** کلیک کنید.
2. پروتکل را **VLESS** انتخاب کنید.
3. **Listen Port** را روی `8080` تنظیم کنید.
4. **Network** را روی `ws` (WebSocket) بگذارید.
5. **Path** را روی `/cdn` تنظیم کنید.
6. سایر تنظیمات (UUID، TLS و…) را مطابق نیاز خود پیکربندی کنید.
7. روی **Save** کلیک کنید.

> 💡 **نکته**: پورت `8080` و مسیر `/cdn` دقیقاً همان‌هایی هستند که در `nginx.conf.template` تعریف شده‌اند. اگر این مقادیر را تغییر دهید، باید فایل Nginx را هم به‌روزرسانی کنید.

---

## 📁 ساختار فایل‌ها

| فایل | توضیح |
| :--- | :--- |
| `Dockerfile` | ایمیج رسمی `alireza7/x-ui` را گرفته و Nginx را نصب می‌کند |
| `nginx.conf.template` | تنظیمات Nginx برای مسیریابی پنل و اینباند |
| `start.sh` | اسکریپت شروع که Nginx و x-ui را اجرا می‌کند |

---

## ⚠️ محدودیت‌ها

- **WireGuard کرنل**: Railway دسترسی به `/dev/net/tun` و قابلیت `NET_ADMIN` را نمی‌دهد. بنابراین بخش WireGuard در x-ui روی Railway **کار نخواهد کرد**. فقط پروتکل‌های مبتنی بر Xray (VLESS، VMess، Trojan، Shadowsocks) قابل استفاده هستند.
- **محدودیت IP**: قابلیت محدودیت IP بر پایه `nftables` ممکن است روی Railway کار نکند، چون به دسترسی کرنل نیاز دارد.
- **ذخیره‌سازی موقت**: بدون اتصال Volume، داده‌ها با هر Redeploy پاک می‌شوند.

---

## 🛠️ عیب‌یابی

| مشکل | راه‌حل |
| :--- | :--- |
| پنل باز نمی‌شود | مطمئن شوید مسیر `/managepanel/` را با اسلش انتهایی وارد کرده‌اید |
| خطای 502 | بررسی کنید x-ui به درستی اجرا شده باشد (لاگ‌های Railway را ببینید) |
| داده‌ها پاک می‌شوند | Volume را به مسیر `/etc/x-ui` متصل کنید |
| اینباند وصل نمی‌شود | پورت اینباند را `8080` و مسیر را `/cdn` تنظیم کنید |

---

## 🤝 مشارکت

از اینکه به این پروژه علاقه نشان می‌دهید سپاسگزارم! برای مشارکت:

1. ریپازیتوری را فورک کنید.
2. یک شاخه‌ی جدید بسازید (`git checkout -b feature/amazing-feature`).
3. تغییرات را کامیت کنید (`git commit -m 'Add some amazing feature'`).
4. شاخه را پوش کنید (`git push origin feature/amazing-feature`).
5. یک Pull Request باز کنید.

---

## 📜 مجوز

این پروژه تحت مجوز **GPL-3.0** منتشر شده است. برای اطلاعات بیشتر فایل [LICENSE](LICENSE) را ببینید.

---

## 🙏 تقدیر و تشکر

- [alireza0/x-ui](https://github.com/alireza0/x-ui) — پروژه‌ی اصلی
- [XTLS/Xray-core](https://github.com/XTLS/Xray-core) — هسته‌ی Xray
- [Railway](https://railway.app) — پلتفرم استقرار
- [Regionhero12](https://github.com/Regionhero12) — سازنده‌ی این نسخه‌ی Railway

---

<div align="center">

**ساخته شده با ❤️ توسط [@Regionhero12](https://github.com/Regionhero12)**

⭐ اگر این پروژه برایتان مفید بود، یک ستاره بدهید!

</div>
