#EC2 Instance Creation
resource "aws_instance" "Instance_Deepak" {
 instance_type = var.instance_type
 ami     = data.aws_ami.amzlinux2.id
 key_name = var.instance_keypair
 tags = {
 Name = "Instance_Deepak"
 }
 user_data = file("${path.module}/data.sh")
 vpc_security_group_ids = [aws_security_group.ports_allow.id]
}
