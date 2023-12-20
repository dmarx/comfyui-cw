FROM ghcr.io/coreweave/ml-containers/torch:f35193e-base-cuda12.2.2-torch2.1.1-vision0.16.1-audio2.1.1

# this should already by the WORKDIR
WORKDIR /usr/src/app
RUN git clone --depth=1 https://github.com/comfyanonymous/ComfyUI

WORKDIR /usr/src/app/ComfyUI/custom_nodes
RUN git clone --depth=1 https://github.com/ltdrdata/ComfyUI-Manager
RUN git clone --depth=1 https://github.com/pythongosssss/ComfyUI-Custom-Scripts

WORKDIR /usr/src/app/ComfyUI
ENTRYPOINT ["python", "main.py", "--port", "8000"]
