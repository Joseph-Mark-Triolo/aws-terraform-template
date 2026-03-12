terraform {
  backend "s3" {
    region = "your-region"
    bucket = "tfstate-bucket-name"
    key    = "tfstate-object-key"
  }
}
