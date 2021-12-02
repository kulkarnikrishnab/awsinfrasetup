resource "aws_instance" "vm1" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.instance_type
  subnet_id = aws_subnet.devvpc-public-0.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = aws_key_pair.poc.key_name
  user_data = "${file("install-apache-webserver.sh")}"
  tags = {
    Name = "web-server-1"
  }
}


resource "aws_instance" "vm2" {
  ami           = var.AMIS[var.AWS_REGION]
  instance_type = var.instance_type
  subnet_id = aws_subnet.devvpc-public-1.id
  vpc_security_group_ids = [aws_security_group.allow-ssh.id]
  key_name = aws_key_pair.poc.key_name
  user_data = "${file("install-apache-webserver.sh")}"
  tags = {
    Name = "web-server-2"
  }
}
