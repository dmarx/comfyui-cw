FROM ghcr.io/coreweave/ml-containers/torch:f35193e-base-cuda12.2.2-torch2.1.1-vision0.16.1-audio2.1.1

# this should already by the WORKDIR
WORKDIR /usr/src/app
RUN git clone --depth=1 https://github.com/comfyanonymous/ComfyUI
RUN pip install --upgrade pip && pip install -r ComfyUI/requirements.txt

WORKDIR /usr/src/app/ComfyUI/custom_nodes
RUN git clone --depth=1 https://github.com/ltdrdata/ComfyUI-Manager
RUN git clone --depth=1 https://github.com/pythongosssss/ComfyUI-Custom-Scripts

##########################################
# <optionalExtensions>
# Advanced Controlnet
RUN git clone --depth=1 https://github.com/Kosinkadink/ComfyUI-Advanced-ControlNet
# AnimateDiff
RUN git clone --depth=1 https://github.com/Kosinkadink/ComfyUI-AnimateDiff-Evolved
# VHS
RUN git clone --depth=1 https://github.com/Kosinkadink/ComfyUI-VideoHelperSuite
# Keyframed
RUN git clone --depth=1 https://github.com/dmarx/ComfyUI-Keyframed
# FizzNodes
RUN git clone --depth=1 https://github.com/FizzleDorf/ComfyUI_FizzNodes
# Impact Pack
RUN git clone --depth=1 https://github.com/ltdrdata/ComfyUI-Impact-Pack
# IPAdaptor
RUN git clone --depth=1 https://github.com/cubiq/ComfyUI_IPAdapter_plus
# WAS
RUN git clone --depth=1 https://github.com/WASasquatch/was-node-suite-comfyui
# Controlnet Aux
RUN git clone --depth=1 https://github.com/Fannovel16/comfyui_controlnet_aux
# Upscale
RUN git clone --depth=1 https://github.com/ssitu/ComfyUI_UltimateSDUpscale
# OpenPose
RUN git clone --depth=1 https://github.com/space-nuko/ComfyUI-OpenPose-Editor
# https://github.com/whmc76/ComfyUI-Openpose-Editor-Plus
# CivitAI
RUN git clone --depth=1 https://github.com/civitai/comfy-nodes
# tooling
RUN git clone --depth=1 https://github.com/Acly/comfyui-tooling-nodes
# Image browser/file browser
RUN git clone --depth=1 https://github.com/talesofai/comfyui-browser
# segment anything
RUN git clone --depth=1 https://github.com/storyicon/comfyui_segment_anything
# steerable cause why not
# https://github.com/banodoco/steerable-motion
# https://github.com/11cafe/comfyui-workspace-manager
# https://github.com/thecooltechguy/ComfyUI-MagicAnimate
# Krita
# </optionalExtensions>
###########################################

ENTRYPOINT ["python", "main.py", "--port", "8000", "--listen", "0.0.0.0"]
