# nginx-plus for docker


### 一、 说明

基于： docker:nginx 

docker-image 构建：

> podman build -t nginx-plus ./


### 二、 使用说明

2.1 测试运行：

```
podman run --name nginx-cs -p 8000:80 nginx-plus
```

2.2 运行服务
```
podman run -d --name web8001 -p 8001:80 -v /var/www/web81/www:/www -v /var/www/web81/config:/etc/nginx/http.d -v /var/www/web81/log:/var/log/nginx  nginx-plus
```

### 补充：关于宿主机目录结构

注意: nginx-plus的每个web服务都应具有如下目录结构：

```
/var/www/webXXX 	虚拟主机根目录
  |-www                   网页文件根目录
    |- *                  web相关文件
  |-config                虚拟主机配置目录(至少一个配置文件，建议一个)
    |-{anyName}.conf      nginx中的server配置
  |-log                   日志目录（默认为空即可）
    |-access.log          (生动生成)
    |-error.log           (生动生成)
```

