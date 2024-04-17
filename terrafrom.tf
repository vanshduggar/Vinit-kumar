provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "web" {
  ami           = "ami-007020fd9c84e18c7"
  instance_type = "t2.large"

  tags = {
    Name = "terraform-example"
  }

  user_data = <<-EOF
              #!/bin/bash
              yum install -y httpd php
              systemctl start httpd
              systemctl enable httpd
              EOF
}

output "13.127.90.4 " {
  value = aws_instance.web.public_ip
}
