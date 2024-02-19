# main.tf

# Creación de un archivo local
resource "local_file" "example" {
  filename = "hello.txt"
  content  = "Hello, world!"
}
