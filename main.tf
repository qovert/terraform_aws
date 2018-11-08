provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami		= "ami-079b4e9085609225c"
  instance_type = "t2.micro"

  tags {
    Name = "test_machine"
  }
}
