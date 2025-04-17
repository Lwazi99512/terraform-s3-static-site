resource "aws_s3_bucket" "static_website" {
  bucket = "my-terraform-bucket-yourname123"  # Replace with your unique bucket name
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.static_website.bucket

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "error.html"  # Optional: You can specify an error page if you want
  }
}

resource "aws_s3_bucket_public_access_block" "example" {
  bucket = aws_s3_bucket.static_website.bucket

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}
