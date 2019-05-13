aws_profile = "default"

aws_region = "us-west-1"

vpc_cidr = "10.0.0.0/16"

cidrs = {
  public1  = "10.0.1.0/24"
  public2  = "10.0.2.0/24"
  private1 = "10.0.3.0/24"
  private2 = "10.0.4.0/24"
  rds1     = "10.0.5.0/24"
  rds2     = "10.0.6.0/24"
  rds3     = "10.0.7.0/24"
}

# curl canhasip.com, and /32 for single IP only.
localip = "50.202.74.57/32"

domain_name = "patrickgpresto"

db_instance_class = "db.t2.micro"

dbname = "pprestodb"

dbuser = "pprestodb"

dbpassword = "mydbpasswd"

elb_healthy_threshold = "2"

elb_unhealthy_threshold = "2"

elb_timeout = "3"

elb_interval = "30"

dev_instance_type = "t2.micro"
dev_ami = "ami-0ec6517f6edbf8044"
public_key_path = "~/.ssh/ppresto.pub"
key_name = "ppresto"

asg_max = "2"
asg_min = "1"
asg_grace = "300"
asg_hct = "EC2"
asg_cap = "2"
lc_instance_type = "t2.micro"
delegation_set = "N32FVTUBI56RRL"
