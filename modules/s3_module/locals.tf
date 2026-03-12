locals {
  objects = {
    for f in fileset(var.file_path, "*") :
    f => "${var.file_path}${f}"
  }
}

