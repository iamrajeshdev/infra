
# resource "aws_key_pair" "key_pair" {

#   # Name of the Key
#   key_name   = "my_key_${var.environment}"
#   # Adding the SSH authorized key !
#   public_key = file("~/.ssh/authorized_keys")
  
#  }


 resource "aws_subnet" "subnet_us_east_1a" {  
  # VPC in which subnet has to be created!
  vpc_id = var.vpc_id
  
  # IP Range of this subnet
  cidr_block = "10.0.0.0/25"
  
  # Data Center of this subnet.
  availability_zone = "us-east-1a"
  
  # Enabling automatic public IP assignment on instance launch!
  map_public_ip_on_launch = true

  tags = {
    Name = "Public Subnet"
  }
 }

resource "aws_security_group" "hk_sec_group" {
  name = "${var.vpc_name}_sec_group_0"
  description = "security group for ${var.vpc_name} in ${var.environment} environment"
  vpc_id = var.vpc_id

  // To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  // To Allow Port 80 Transport
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}


resource "aws_instance" "hk_ec2_instance" {
  ami = var.ami
  instance_type = var.itype
  subnet_id = aws_subnet.subnet_us_east_1a.id
  # key_name = "my_key_${var.environment}"

  vpc_security_group_ids = [
    aws_security_group.hk_sec_group.id
  ]
  root_block_device {
    delete_on_termination = true
    iops = 150
    volume_size = 50
    volume_type = "gp2"
  }
  tags = {
    Name ="server_${var.vpc_name}_${var.environment}"
    Environment = "${var.environment}"
    OS = "Amazon Linux"
    Managed = "IAC"
  }

  depends_on = [ aws_security_group.hk_sec_group ]
}