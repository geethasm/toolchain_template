
resource "ibm_resource_group" "cos_group" {
  name     = "resource-dev2"
}

resource "ibm_resource_instance" "cos_instance" {
  name              = "my-cos-instance4"
  resource_group_id = ibm_resource_group.cos_group.id
  service           = "cloud-object-storage"
  plan              = "standard"
  location          = "global"
}

resource "ibm_cos_bucket" "standard-ams03" {
  bucket_name          = "ibm-my-bucket4"
  resource_instance_id = ibm_resource_instance.cos_instance.id
  region_location      = "us-south"
  storage_class        = "standard"
}

