## 简介

stable-diffusion-webui镜像文件, 包含如下两个版本
- base: 基础版本，只包含常见插件, 不带模型文件
- all:  除base版本功能外,打包了controlnet模型

## 快速开始
```bash
docker run -d --name webui --gpus all -p 7860:7860 -p 8888:8888 --name stable-diffusion-webui -d tiancheng91/stable-diffusion-webui
```

访问 
 - localhost:7860 , webui默认账号密码 root:123456, 可以通过$password环境变量自定义
 - localhost:8888 , jupyterlab页面

完整版本

```
docker run -d --name webui --gpus all -p 7860:7860 -p 8888:8888 --name stable-diffusion-webui -d tiancheng91/stable-diffusion-webui:all
```