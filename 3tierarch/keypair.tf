resource "aws_key_pair" "web-key" {
  key_name   = "web-key"
  public_key = ""
}

resource "aws_key_pair" "app-key" {
  key_name   = "app-key"
  public_key = ""
}

resource "aws_key_pair" "db-key" {
  key_name   = "db-key"
  public_key = ""
}