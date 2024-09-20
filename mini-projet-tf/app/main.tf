terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.65.0"
    }
  }

  # backend "s3" {
  #   region     = "us-east-1"
  #   shared_credentials_files = ["../.secrets/credentials"]
  #   bucket = "backend-eazyastuces"
  #   key = "eazy-astuce.tfstate"
  # }
}

provider "aws" {
  region                   = "us-east-1"
  shared_credentials_files = ["../../.secrets/credentials"]
  profile                  = "default"
}

module "jenkins-ec2" {
  depends_on    = [module.sg, module.keypair]
  source        = "../modules/ec2"
  instance_type = "t2.medium"
  aws_common_tag = {
    Name = "jenkins-ec2"
  }
  key_name        = module.keypair.key_name
  security_groups = [module.sg.aws_sg_name]
  private_key     = module.keypair.private_key
}

module "keypair" {
  source   = "../modules/keypair"
  key_name = "devops-jenkins"
}

module "sg" {
  source  = "../modules/sg"
  sg_name = "jenkins-sg"
}

module "eip" {
  source = "../modules/eip"
}

module "ebs" {
  source = "../modules/ebs"
  AZ     = "us-east-1a"
  size   = 6
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = module.ebs.aws_ebs_volume_id
  instance_id = module.jenkins-ec2.aws_instance_id
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = module.jenkins-ec2.aws_instance_id
  allocation_id = module.eip.aws_eip_id
}

resource "null_resource" "output_datas" {
  depends_on = [module.jenkins-ec2]
  provisioner "local-exec" {
    command = "echo jenkins_ec2 - PUBLIC_IP: ${module.eip.aws_eip_id} - PUBLIC_DNS: ${module.jenkins-ec2.public_dns} > jenkins_ec2.txt"
  }
}