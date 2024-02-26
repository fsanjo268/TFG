resource "local_file" "foo" {
  content  = "foo!"
  filename = "/media/foo.txt"
}
