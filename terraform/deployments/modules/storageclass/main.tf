resource "kubernetes_storage_class" "example" {
  metadata {
    name = "ebs-sc"
    annotations = {
      "storageclass.kubernetes.io/is-default-class" = true
    }
  }
  storage_provisioner = "ebs.csi.aws.com"
  parameters = {
    type                        = "gp2"
    "csi.storage.k8s.io/fstype" = "ext4"
  }
  volume_binding_mode = "WaitForFirstConsumer"
}
