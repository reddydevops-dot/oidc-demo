module "security_group" {
  source = "./modules/security-group"

  name        = "${var.environment}-web-sg"
  vpc_id      = var.vpc_id
  environment = var.environment
}


module "ec2" {
  source = "./modules/ec2"

  ami_id            = var.ami_id
  instance_type     = var.instance_type
  subnet_id         = var.subnet_id
  security_group_id = module.security_group.security_group_id

  name        = "${var.environment}-new-web-server"
  environment = var.environment
}