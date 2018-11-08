provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "example" {
  ami		= "ami-079b4e9085609225c"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  user_data = <<-EOF
	      #!/bin/bash
	      echo "It lives!" > index.html
	      nohup busybox httpd -f -p 8080 &
	      EOF

  tags {
    Name = "test_machine"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-testing-instance"
  
  ingress {
    from_port	= 8080
    to_port	= 8080
    protocol	= "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
