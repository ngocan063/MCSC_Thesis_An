
module "ec2_frontend" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "ubuntu3"
  monitoring             = true
  vpc_security_group_ids = [module.sg-frontend.security_group_id]
  subnet_id              = element(module.vpc.public_subnets,0)
  name                   = "frontend_terraform"

  tags = {
    Terraform   = "true"
    Environment = "bastion"
  }
}


module "ec2_database" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"
  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "ubuntu3"
  monitoring             = true
  vpc_security_group_ids = [module.sg-database.security_group_id]
  subnet_id              = element(module.vpc.private_subnets,0)
  name                   = "Database_terraform"
  instance_count         = 1


  tags = {
    Terraform   = "true"
    Environment = "database"
  }
}
module "ec2_backend" {
  source                 = "terraform-aws-modules/ec2-instance/aws"
  version                = "~> 2.0"

  ami                    = "ami-09e67e426f25ce0d7"
  instance_type          = "t2.micro"
  key_name               = "ubuntu3"
  monitoring             = true
  vpc_security_group_ids = [module.sg-backend.security_group_id]
  subnet_id              = element(module.vpc.private_subnets,1)
  name                   = "backend_terraform"
  instance_count         = 1
  tags = {
    Terraform   = "true"
    Environment = "backend"
  }
}

