data "http" "myip" {
  url = "http://ipv4.icanhazip.com"
}
module "sg-bastion" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg_-bastion"
  description = "Security group for bastion"
  vpc_id      = module.vpc.vpc_id
  ingress_with_cidr_blocks = [
    {
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "${chomp(data.http.myip.body)}/32"
    }]
   egress_with_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"

      cidr_blocks      = "0.0.0.0/0"
    }
  ]
    tags = {
    Name = "allow_ssh"
  }
}

module "sg-Jenkins" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg_Jenkins"
  description = "Security group for Jenkins"
  vpc_id      = module.vpc.vpc_id

 ingress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = -1
      description = "ssh-service ports"
      cidr_blocks = "10.0.0.0/16"
    }]
   egress_with_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = "0.0.0.0/0"
    }
  ]
    tags = {
    Name = "allow_vpc"
  }
}

  module "sg-web-app" {
  source = "terraform-aws-modules/security-group/aws"

  name        = "sg_web_app"
  description = "Security group for web app"
  vpc_id      = module.vpc.vpc_id
 ingress_with_cidr_blocks = [
    {
      from_port   = 80
      to_port     = 80
      protocol    = "tcp"
      description = "ssh-service ports"
      cidr_blocks = "${chomp(data.http.myip.body)}/32"
}]
   egress_with_cidr_blocks = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = "0.0.0.0/0"
    }
  ]
    tags = {
    Name = "allow_http"
  }
}
