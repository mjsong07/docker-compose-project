FROM allinurl/goaccess:latest

# 设置中文时区
ENV TIME_ZONE=Asia/Shanghai
RUN /bin/cp /usr/share/zoneinfo/$TIME_ZONE /etc/localtime && echo $TIME_ZONE > /etc/timezone

# 设置中文语言
ENV LANG zh_CN.UTF-8 
CMD goaccess -a -d -f /srv/logs/access.log --port=7890 -p /srv/data/goaccess.conf > /srv/report/index.html --real-time-html
# ENTRYPOINT goaccess -a -d -f /srv/logs/access.log --port=7890 -p /srv/data/goaccess.conf > /srv/report/index.html --real-time-html 