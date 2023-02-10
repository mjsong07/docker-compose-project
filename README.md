# docker-compose-project
# 支持 php nginx mysql mongo node 
# 说明
1. data 服务做容器的数据映射，如mysql，mongodb的映射
2. dist 用于部署前端的网页资源，如html，php等
3. logs 存放各个容器对应的日志信息
4. .env配置 关键的数据库账户和参数设置
5. 不同的yml 对应不同的容器
# 使用
# 创建文件夹
mkdir docker-compose-project
# 创建环境配置， 复制下面的配置
touch .env
vi .env
# 创建需要启动的docker-compose文件， 复制下面对应需要的内容
touch docker-compose-nginx.yml
vi docker-compose-nginx.yml

# 根据不同的配置 启动对应服务

# 启动 nginx 
docker-compose -f docker-compose-nginx.yml  up
# 启动 nginx-node-mongo
docker-compose -f docker-compose-nginx-node-mongo.yml  up
# 启动 nginx-php-mysql
docker-compose -f docker-compose-nginx-php-mysql.yml  up

# 启动docker 图形管理
docker-compose -f docker-compose-portainer.yml  up -d
# 启动私有仓库
docker-compose -f docker-compose-registry.yml  up -d





# mongo 备份
## 1.必须进入执行.yml 的文件夹
cd /docker-compose-project/

## 2.先查询当前 mongo对应的 CONTAINER_ID 容器ID 
docker ps 
#CONTAINER ID   IMAGE         xxx
#3d1ccf9bf4b7   mongo-express   xxxx 

## 3.先查询当前 mongo对应的 CONTAINER_ID 容器ID
docker exec -it 3d1ccf9bf4b7 bash

## 4.登录mnogodb
mongo -u mongoadmin -p mongoadmin

## 导入 导出约定 
宿主电脑备份地址  /docker-compose-project/data/mongodb_backup/databaseName/
容器电脑备份地址 /data/mongodb_backup/databaseName/

## 整个数据库导出
mongodump  -p 27017  -u mongoadmin -p mongoadmin --authenticationDatabase admin -h 127.0.0.1 -d databaseName -o /data/mongodb_backup
## 整个数据库导入
mongorestore  -p 27017  -u mongoadmin -p mongoadmin --authenticationDatabase admin -h 127.0.0.1 -d databaseName /data/mongodb_backup

# 单个集合导出
## 导出 一次只能导出一个集合
mongoexport -p 27017  -u mongoadmin -p mongoadmin --authenticationDatabase admin -d databaseName -c collectionName -o /data/mongodb_backup/collectionName.json
## 导入 一次只能导入一个集合
mongoimport -p 27017  -u mongoadmin -p mongoadmin --authenticationDatabase admin -d databaseName -c collectionName --file /data/mongodb_backup/mongodb_backup/collectionName.json

## 复制当前容器路径 到 宿主电脑
docker cp [CONTAINER ID]:/data/mongodb_backup  /docker-compose-project/data/mongodb_backup/

## 复制宿主电脑路径 到 容器路径里
docker cp  /docker-compose-project/data/mongodb_backup [CONTAINER ID]:/data/mongodb_backup
