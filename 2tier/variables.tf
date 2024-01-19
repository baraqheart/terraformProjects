variable "region" {
  default     = "us-east-1"
  description = "this is our region"
  type        = string
}

variable "project_name" {
  default = "bank-App"
}

variable "az1" {
  default = "us-east-1b"
}

variable "az2" {
  default = "us-east-1c"
}

variable "key" {
  default = "/home/baraqheart/.ssh/id_rsa.pub"
}