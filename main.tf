provider "aws" {
  region = "ap-south-1"  # Update with your preferred AWS region
}

resource "aws_instance" "web" {
  ami           = "ami-0c55b159cbfafe1f0"  # Use a PHP compatible AMI
  instance_type = "t2.large"  # Use an instance type suitable for your needs
  key_name      = "vinitkumar"  # Update with your EC2 key pair
  security_groups = [
    "sg-074d3e320fc8eb225",  # Update with your security group ID
  ]

  tags = {
    Name = "php-app"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd php",
      "sudo systemctl start httpd",
      "sudo systemctl enable httpd"
    ]
  }
}
