# 拉取镜像
docker pull registry:2
# 启动
docker run -d -p 5000:5000 --restart always --name registry registry:2
# 创建镜像
docker pull nginx
docker tag nginx localhost:5000/nginx # 先给本地打上标签 记得需要用ip+端口
# 推送到私有服务器
docker push localhost:5000/nginx

# 查看镜像
docker images


# 另外一台服务器要访问
需要配置  /etc/docker/daemon.json 中的insecure-registries，不然会提示 不是https 不安全
{
"insecure-registries":["xxxx.xxx.xxx.xxx:5000"],
"registry-mirrors": ["https://9fgss2yh.mirror.aliyuncs.com"]
}
# 重启docker
systemctl restart docker

# 开始拉取 
docker pull 171.35.xxx.xxx:5000/nginx


# 安装 webUI界面
docker run -it -p 5001:8080 --name registry-web -d --restart always --link registry -e REGISTRY_URL=http://registry:5000/v2 -e REGISTRY_NAME=localhost:5000 hyper/docker-registry-web



# 修改docker 源
vi /etc/docker/daemon.json


{
"registry-mirrors" : [
    "https://jkfdsf2u.mirror.aliyuncs.com",
    "https://registry.docker-cn.com"
  ],
  "insecure-registries" : [
    "docker-registry.zjq.com",
    "171.35.40.74:5000"
  ],
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "10"
  },
  "data-root": "/data/docker"
}
# 重启docker
systemctl restart docker