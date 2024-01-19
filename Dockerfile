#FROM ghcr.io/coreweave/ml-containers/torch:f35193e-base-cuda12.2.2-torch2.1.1-vision0.16.1-audio2.1.1
# for python 3.10
FROM ghcr.io/coreweave/ml-containers/torch-extras:es-22.04-3ce72cc-nccl-cuda12.2.2-nccl2.19.3-1-torch2.1.2-vision0.16.2-audio2.1.2-flash_attn2.3.6

RUN mkdir -p /usr/src/app

# this should already by the WORKDIR
WORKDIR /usr/src/app
RUN git clone --depth=1 https://github.com/comfyanonymous/ComfyUI
RUN pip install --upgrade pip && pip install -r ComfyUI/requirements.txt

WORKDIR /usr/src/app/ComfyUI/custom_nodes
RUN git clone --depth=1 https://github.com/ltdrdata/ComfyUI-Manager
RUN git clone --depth=1 https://github.com/pythongosssss/ComfyUI-Custom-Scripts

# Put additional extensions you want installed in repos.txt and they'll be installed here
COPY install_script.sh /install_script.sh
COPY repos.txt /repos.txt
RUN chmod +x /install_script.sh
RUN /install_script.sh

# use cw catalog to launch NFS server to mount PVC
# this probably needs to get moved into the entrypoint script. EDIT: ...yup
#RUN mkdir /mnt/storage
#RUN mount -t nfs -o vers=4.2,noatime,nodiratime,nolock comfyui-atorage-nfs-mount:/storage /mnt/storage

#WORKDIR /usr/src/app/ComfyUI
#ENTRYPOINT ["python", "main.py", "--port", "8000", "--listen", "0.0.0.0"]

#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
##RUN /entrypoint.sh
WORKDIR /usr/src/app/ComfyUI
#ENTRYPOINT ["/entrypoint.sh"]
