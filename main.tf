module "create_sg" {
    source = "./modules/create_sg"
    sg_name = var.root_sg_name
}

module "create_pem" {
    source = "./modules/create_pem"
    key_name = var.root_key_name
    key_path = var.root_key_path
}

module "create_ec2_2" {
    source = "github.com/jaintpharsha/terra_module.git//create_ec2"
    ami_id = var.root_ec2_ami
    ec2_type = var.root_ec2_type
    ec2_pem = module.create_pem.ec2_pem
    ec2_sg_id = module.create_sg.sg_id
}



