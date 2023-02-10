# 参考文章
https://juejin.cn/post/7186947770811416632

# 项目工作路径
本地  ./code/php 
容器  /var/www


# php 默认配置地址 
/usr/local/etc/php 
把 当前的 php.ini-development 重命名为 php.ini ，并 复制到 容器地址 /usr/local/etc/php 

# php 日志位置
/usr/local/error.log 关联本地 ./logs/php/error.log

# php-fpm 默认配置
/usr/local/etc/php-fpm.d/www.conf

# 修改项目配置 .env 
## 打开debug模式
APP_DEBUG=true 


# 查看错误日志 
直接查询
tail -f 100  ./code/php/prjectname/storage/logs/laravel.log
进入php 容器 查询
tail -f 100 /var/www/prjectname/storage/logs/laravel.log

# 清空缓存 
进入php 容器
docker exec -it docker_compose_ylzs-php-1 sh
进行项目根目录
 cd myproject 
清除config  
php artisan config:clear
非必要
php artisan cache:clear
php artisan config:cache