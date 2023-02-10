# 用于测试 Dockerfile 是否有效
docker build -t node1 -f Dockerfile .
docker run --rm --name node1 -p 3000:3000 -it  -d  --privileged=true node1
# 存放路径
/docker-compose-project/dist/node/projectname
 
# 查看日志
docker logs -f myapp
docker logs -f myapp -t --tail 行数 容器名

# 查看pm2管理情况
docker exec -it 8205f9c2f6cd pm2 list
