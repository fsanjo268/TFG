resource "local_file" "foo" {
  content  = "foo!"
  filename = "/var/lib/jenkins/workspace/TFG/Despliegue_ejercicios/Terraform/foo.txt"
}
