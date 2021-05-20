# dell-redfish-iso

This is a container image with ansible installed and a simply play to boot a Dell PowerEdge server to an ISO file with DMTF Redfish.

Usage:

```
podman run --rm --net=host quay.io/dphillip/dell-redfish-iso boot_image=http://www.example.com:80/dual_stack.iso -e bmc_address=my_idrac_ip
```

The extra variables `bmc_user` and `bmc_password` can be passed. They default to the Dell defaults.
