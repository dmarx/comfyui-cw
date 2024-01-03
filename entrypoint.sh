#!/bin/bash

# mount persistent volume
mkdir /mnt/storage
mount -t nfs -o vers=4.2,noatime,nodiratime,nolock comfyui-atorage-nfs-mount:/storage /mnt/storage

cd /usr/src/app/ComfyUI

# todo: pass in command line arguments
python main.py --port 8000 --listen 0.0.0.0 --output-directory "/storage"
