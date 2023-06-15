#!/bin/bash

# # init diffusion lora
if [ -d /storage/lora ]; then
  cp -r /storage/lora/* /content/stable-diffusion-webui/models/Lora/
fi

# # init diffusion model
if [ -d /storage/models ]; then
  ln -s /storage/models/* /content/stable-diffusion-webui/models/Stable-diffusion/
fi

# copy huggingface
if [ -d /content/stable-diffusion-webui/huggingface ]; then
  cp -r /content/stable-diffusion-webui/huggingface ~/.cache/huggingface
fi

# run diffusion
cd /content/stable-diffusion-webui 
if [ -z "$password" ]; then
    password="123456"
fi
python webui.py --xformers --listen --enable-insecure-extension-access --gradio-queue --api --gradio-auth root:$password