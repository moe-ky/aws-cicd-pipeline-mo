resource "aws_s3_bucket" "state-file-bucket" {
  bucket = "mo-tf-state-file"
  acl    = "private"

  tags = {
    Name        = "mo-test"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}

resource "aws_s3_bucket" "pipeline-artifact" {
  bucket = "mo-pipeline-artifact-bucket"
  acl    = "private"

  tags = {
    Name        = "mo-test"
    Environment = "Dev"
  }

}

resource "aws_s3_bucket" "data-lake-bucket" {
  bucket = "data-lake-debt-bucket"
  acl    = "private"

  tags = {
    Name        = "mo-test"
    Environment = "Dev"
  }

  versioning {
    enabled = true
  }
}



# Upload an object
resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.data-lake-bucket.id

  key    = "glue-_script/example.py"

  acl    = "private"  # or can be "public-read"

  source = "example.py"

  etag = filemd5("example.py")

}