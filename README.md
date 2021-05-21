# dell-redfish-iso

This is a container image with ansible installed and a simple play to boot a Dell PowerEdge server to an ISO file with DMTF Redfish.

Usage:

```
podman run --rm --net=host quay.io/dphillip/dell-redfish-iso boot_image=http://www.example.com:80/dual_stack.iso \
-e bmc_address=my_idrac_ip
```

The extra variables `bmc_user` and `bmc_password` can be passed. They default to the Dell defaults. Additionally, if there is an image other than `boot_image` that needs to be disconnected first `disco_image` can be called.

For example:
```
ISO_URL=$(oc get infraenv dual-ocp-infraenv -o jsonpath='{.status.isoDownloadURL}')
podman run --net=host quay.io/dphillip/dell-redfish-iso:latest -e bmc_address=my_idrac_ip \
-e boot_image=http://$(hostname -i):80/dual_stack.iso -e disco_image=${ISO_URL}
```
