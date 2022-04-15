
#Reading CSV files
locals {
  instances = csvdecode(file("./InputCSV/ec2build.csv")) // Path of the csv.
}

module "ec2" {
  source = "git::vs-ssh.visualstudio.com:v3/PATH TO REPO HERE"
  
  for_each          = { for server in local.instances : server.name => server }
    instance_profile         = var.instance_profile
    kms_key_id               = var.kms_key_id
    name                     = each.value.name
    vpc_id                   = each.value.vpc_id
    cr_request               = each.value.cr_request
    Application              = each.value.Application
    BussinessUnit            = each.value.BussinessUnit
    Department               = each.value.Department
    ApplicationSupport       = each.value.ApplicationSupport
    Environment              = each.value.Environment
    ApplicationRole          = each.value.ApplicationRole
    ApplicationOwner         = each.value.ApplicationOwner
    DRRequired               = each.value.DRRequired
    Decomm                   = each.value.Decomm
    RTO                      = each.value.RTO
    RPO                      = each.value.RPO
    Notes                    = each.value.Notes
    Backup                   = each.value.Backup
    Project                  = each.value.Project

    default_sg               = each.value.default_sg
    shared_management_sg     = each.value.shared_management_sg 
    subnet_id                = each.value.subnet_id
    private_ips_count        = each.value.private_ips_count
    ami_id                   = each.value.ami_id
    instance_type            = each.value.instance_type
    key_name                 = each.value.key_name
    user_data                = each.value.user_data
    availability_zone        = each.value.availability_zone
    root_drive_size          = each.value.root_drive_size
    vol_count                = each.value.count
    extra_drives_sizes       = split(",", each.value.extra_drives_sizes)
    extra_drives_names       = split(",", each.value.extra_drives_names)
}
