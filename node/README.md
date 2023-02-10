# 部署流程
# 已调整为 docker部署  /docker_compose_project/node
cd /docker_compose_project/
# 重新docker-compose 编译
docker-compose build node
# 重新docker-compose 运行容器
docker-compose restart node


# 部署
1.部署是基于jenkis 用npm 已经install 好的包，只需解压
2.nuxt项目启动器需要先build 一下
3.node 服务使用 pm2 启动

# 调试
# Dockerfile文件 可以使用test.sh的脚本


# pm2 默认的日志地址
error  : /root/.pm2/logs/projectname-error.log
out log path  : /root/.pm2/logs/projectname-out.log
pid path  : /root/.pm2/pids/projectname-0.pid