
resource "aws_s3_bucket" "main" {
  bucket = "${var.bucket_name}"

  # Remove this line if you want to prevent accidental deletion of bucket 
  force_destroy = true

  tags = {
    ManagedBy = "terraform"
    Changed   = formatdate("YYYY-MM-DD hh:mm 12:52pm", timestamp())
  }

  lifecycle {
    ignore_changes = [tags]
  }
}
