
# 有效果，但不能在docker-compose up一起集成使用 优先使用
tail -f  /docker_workspace/docker-compose/docker_compose_ylzs/logs/nginx/access.log | docker run -p 7890:7890 --rm -i -e LANG=$LANG allinurl/goaccess -a -o html --log-format COMBINED --real-time-html - > /docker_workspace/docker-compose/docker_compose_ylzs/dist/html/report/index.html
 
## 直接goaccess运行
命令行显示
goaccess access.log
生成一个HTML报告： 
goaccess -a -d -f /srv/logs/access.log --port=7891 -p /srv/data/goaccess.conf > /srv/report/report.html --real-time-html 