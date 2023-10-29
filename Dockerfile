FROM nginx

WORKDIR /www

# 建立一个默认配置（让nginx可以正常运行）
COPY src/default.conf /etc/nginx/conf.d/default.conf
# 向主目录写入 主页文件
COPY src/index.html ./


# 可挂载目录：虚拟主机配置目录，www目录，日志目录
VOLUME ["/etc/nginx/conf.d", "/www", "/var/log/nginx"]



