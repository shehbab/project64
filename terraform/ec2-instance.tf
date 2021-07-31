resource "aws_instance" "ec2-shehbab" {
  ami                    = "ami-047a51fa27710816e" 
  instance_type          = "t2.micro"
  key_name               = "server-key"
  subnet_id              = aws_subnet.vpc-dev-public-subnet-1.id
  vpc_security_group_ids = [aws_security_group.dev-vpc-sg.id]
  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install httpd -y
    sudo systemctl enable httpd
    sudo systemctl start httpd
    echo "<h1>Welcome to Shehbab Home Page</h1>" > /var/www/html/index.html
    EOF
  tags = {
    "Name" = "ec2-shehbab"
  }    
}
