### Requirements

* [terraform ovirt provider](https://github.com/imjoey/terraform-provider-ovirt)

```
git clone https://github.com/imjoey/terraform-provider-ovirt
go get github.com/imjoey/terraform-provider-ovirt
mkdir ~/.terraform.d/plugins
cp $GOPATH/bin/terraform-provider-ovirt ~/.terraform.d/plugins
```

* Trust oVirt Manager (RHV-M )
```
sudo mkdir /usr/share/ca-certificates/extra
sudo curl -o /usr/share/ca-certificates/extra/ovirt-manager.crt -k https://ovirt-manager.io/ovirt-engine/services/pki-resource?resource=ca-certificate&format=X509-PEM-CA
sudo dpkg-reconfigure ca-certificates
```


### Use terraform-ovirt-provisioner:
* variables.tf: contains variables for connecting to REST API and create a vm
* data_stores.tf: retrieve some information about the target datacenter only for testing purposes, so it isn't mandatory
* main.tf: connect to REST API and create a vm, using the cloud-init template

**rhv template requirements**
- cloud-init rpm installed in the vm
- configure root sshd access in the vm
- enable cloud-init in the initial-run setup for vm/template
- configure password or key in the cloud-init

* `terraform init`
* `terraform plan`
* `terraform apply`


