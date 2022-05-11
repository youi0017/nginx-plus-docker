FROM alpine

WORKDIR /www

RUN apk update && \
    apk add nginx

# 建立一个默认配置（让nginx可以正常运行）
COPY src/default.conf /etc/nginx/http.d/default.conf
# 向主目录写入 主页文件
COPY src/index.html ./

#入口文件
COPY entrypoint.sh /usr/bin/entrypoint.sh
RUN chmod +x /usr/bin/entrypoint.sh

# 可挂载目录：虚拟主机配置目录，www目录，日志目录
VOLUME ["/etc/nginx/http.d", "/www", "/var/log/nginx"]

# 声明导出的端口号
EXPOSE 80

ENTRYPOINT [ "/usr/bin/entrypoint.sh" ]

