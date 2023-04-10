base:
	docker build -t tiancheng91/stable-diffusion-webui --file Dockerfile.base ./

all:
	docker build -t tiancheng91/stable-diffusion-webui:all --file Dockerfile.all ./