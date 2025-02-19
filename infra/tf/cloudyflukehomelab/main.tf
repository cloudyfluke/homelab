module "cloudyflukehomelab" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "4.6.0"

  bucket = "cloudyflukehomelab"

  versioning = {
    enabled = true
  }
}
