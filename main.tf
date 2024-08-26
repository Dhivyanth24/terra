provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = var.subnet_id
  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = var.tag_name
  }

  root_block_device {
    volume_size = 8  # Default storage size
  }
}

variable "ami_id" {
  type    = string
  default = "ami-066784287e358dad1"  # Default AMI ID
}

variable "instance_type" {
  type    = string
  default = "t2.micro"  # Default instance type
}

variable "key_name" {
  type    = string
  default = "mykey-pem"  # Default key pair name
}

variable "subnet_id" {
  type    = string
  default = "subnet-01da16a38d642b490"  # Default Subnet ID
}

variable "security_group_id" {
  type    = string
  default = "sg-05c7b17bce31437e7"  # Default Security Group ID
}

variable "tag_name" {
  type = string
}
