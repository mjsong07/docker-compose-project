# 配置地址  
本地：
./nginx/nginx.conf
./nginx/conf.d

容器
/etc/nginx/nginx.conf   
/etc/nginx/conf.d
# html文件地址 
本地 ./dist/html
容器 /usr/share/nginx/html
# php 的部署路径  
在php容器的 var/www
# nginx 安装文件地址

# 重启
cd /docker_workspace/docker-compose/docker_compose_ylzs
docker-compose restart docker_compose_ylzs-nginx-1


# 注意  已废弃
如果使用dockerfile中的 copy 的配置，都需要重新 build  才能copy最新的配置 /etc/nginx/conf.d