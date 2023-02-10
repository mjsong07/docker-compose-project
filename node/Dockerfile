# 制定node镜像的版本
FROM node:14-alpine
WORKDIR /app
# 设置时区
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# 把当前目录的所有信息都复制到容器
ADD . /app
# 解压并重命名 
RUN mv ./prod_yzs_nuxt_web/*  /app
# 如果最新的代码已经修复 启动配置ip问题可以不执行
COPY nuxt.config.js ./

# 也可以改成 git clone 项目，但是内容gitlab 要解决跨网问题
# $ git clone https://github.com/xxxxx.git

# 切换npm源 并且 安装pm2
RUN npm config set registry https://registry.npmmirror.com --global && npm install -g pm2
 
# # 安装依赖 由于jenkis 已经打包不用再安装
# RUN npm run install

# 构建nuxt 对应的.nuxt 隐藏文件夹
RUN npm run build

# 对外暴露的端口
EXPOSE 3000

# node 启动
# CMD ["npm","start"]

# pm2 启动1 
# 等价于 CMD ["sh", "-c", "pm2", "start", "processes.json","--no-daemon" ]
ENTRYPOINT pm2 start processes.json --no-daemon

# pm2 启动2
# ENTRYPOINT [ "pm2", "start", "processes.json","--no-daemon" ]

# pm2 启动3
# ADD ./pm2.sh /
# RUN chmod +x /pm2.sh 
# ENTRYPOINT ["/pm2.sh"]