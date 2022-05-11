# nginx-server for docker


### 一、 说明

基于： alpine + nginx


### 二、 使用说明

2.1 测试运行：

* 版本号
podman run nginx-server -v

* 运行
podman run --name web8081 -p 8080:80 nginx-server start &
注意：最后必需要加 `&`,否则运行将被阻断


2.2 运行服务
```
podman run -d --name web81 -p 81:80 -v /var/www/web81/www:/www -v /var/www/web81/config:/etc/nginx/http.d -v /var/www/web81/log:/var/log/nginx  nginx-server start &
```

### 补充：关于宿主机目录结构
注意: nginx-server的每个web服务都应具有如下目录结构：
```
/var/www/webXXX						虚拟主机根目录
	|-www										网页文件根目录
		|- * 									web相关文件
	|-config								虚拟主机配置目录(至少一个配置文件，建议一个)
		|-{anyName}.conf			nginx中的server配置
	|-log										日志目录（默认为空即可）
		|-access.log 					(生动生成)
		|-error.log 					(生动生成)

```


