# comfyui-cw
experimenting with serving comfyui on coreweave

# Notes

* for persistent storage, create storage volume through UI when update `spec.volumes.persistentVolumeClaim.claimName`

**For My Own Reference**

* [ComfyUI args](https://github.com/comfyanonymous/ComfyUI/blob/master/comfy/cli_args.py)

**TO DO**

* [ ] persist models to attached storage. `--extra-model-paths-config`
* [ ] persistent custom_nodes that doesn't depend on modifying Dockerfile