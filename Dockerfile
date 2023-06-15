# pytorch cuda 基础镜像
FROM tiancheng91/pytorch

## webui
RUN pip3 install xformers triton basicsr facexlib gfpgan && pip cache purge
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git
RUN sed -i -e 's/    start()/    #start()/g' /content/stable-diffusion-webui/launch.py
RUN cd /content/stable-diffusion-webui && python launch.py --skip-torch-cuda-test || true && pip cache purge
ADD ./run.sh /run.sh

## extensions
EXPOSE 7860
CMD ["/bin/sh", "/run.sh"]