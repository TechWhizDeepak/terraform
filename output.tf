#Terraform Output Values

#EC2 Instance Public IP
output "Instance_Publicip" {
    description = "EC2 Instance Public IP"
    value = aws_instance.Instance_Deepak.public_ip
}   

#EC2 Instance Public DNS
output "Instance_PublicDNS" {
    description = "EC2 Instance Public DNS"
    value = aws_instance.Instance_Deepak.public_dns
}   