#!/bin/bash

# init diffusion config
if [ -d /storage/config/diffusion ]; then
  cp -r /storage/config/diffusion/* /content/stable-diffusion-webui/
fi

# init diffusion lora
if [ -d /storage/lora ]; then
  cp -r /storage/lora/* /content/stable-diffusion-webui/models/Lora/
fi

# init diffusion model
if [ -d /storage/models ]; then
  ln -s /storage/models/* /content/stable-diffusion-webui/models/Stable-diffusion/
fi

# init cloudflare
if [ -d /storage/config/cloudflared ]; then 
  cp -r /storage/config/cloudflared ~/.cloudflared
  nohup ~/.cloudflared/cloudflared --no-autoupdate tunnel run webui > /dev/null 2>&1 &
fi

# run diffusion
cd /content/stable-diffusion-webui 
if [ -z "$password" ]; then
    password="123456"
fi
nohup python webui.py --xformers --listen --enable-insecure-extension-access --gradio-queue --api --gradio-auth root:$password > /var/diffusion.log 2>&1 &

# run cmd
if [ $# -eq 0 ]; then
  jupyter lab --allow-root --ip=0.0.0.0 --no-browser --ServerApp.trust_xheaders=True --ServerApp.disable_check_xsrf=False --ServerApp.allow_remote_access=True --ServerApp.allow_origin='*' --ServerApp.allow_credentials=True
else
  "$@"
fi
