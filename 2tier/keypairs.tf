

# key pair block

# key pair for web instance 
resource "aws_key_pair" "key1" {
  key_name   = "bank-app-key"
  public_key = file(var.key)
}


# key pair for app instance 
resource "aws_key_pair" "key2" {
  key_name   = "bank-app-key"
  public_key = file(var.key)
}