## 简介

stable-diffusion-webui镜像文件, 包含如下两个版本
- base: 基础版本，只包含常见插件, 不带模型文件
- all:  除base版本功能外,打包了controlnet模型

## 快速开始
```bash
docker run -d --name webui --gpus all -p 7860:7860 -p 8888:8888 tiancheng91/stable-diffusion-webui
```

访问 
 - localhost:7860 , webui默认账号密码 root:123456, 可以通过$password环境变量自定义
 - localhost:8888 , jupyterlab页面

完整版本

```
docker run -d --name webui --gpus all -p 7860:7860 -p 8888:8888 tiancheng91/stable-diffusion-webui:all
```


helper:
```
curl https://nvidia.github.io/nvidia-docker/centos7/nvidia-docker.repo > /etc/yum.repos.d/nvidia-docker.repo
yum -y install nvidia-container-toolkit
nvidia-ctk --version
nvidia-ctk cdi generate --output=/etc/cdi/nvidia.yaml
grep "  name:" /etc/cdi/nvidia.yaml


podman run --rm --device nvidia.com/gpu=all ubuntu nvidia-smi -L
docker run --gpus 

## docker
nvidia-ctk runtime configure --runtime=docker
docker run --rm --runtime=nvidia --gpus all nvidia/cuda:11.2.0-base-ubuntu20.04 nvidia-smi
