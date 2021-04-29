aws_account_id="655694158741"
aws_region= "us-east-2"
vpc_cidr="10.20.0.0/16"
bastion_ami = {"unix" : "ami-0f57b4cec24530068"}
bastion_instance_type="t2.micro"
key_name="tuftiest"

db_instance_country=["apac","nordics"]

db_instance_ami={
    "apac":"ami-0f57b4cec24530068"
    "nordics" : "ami-0f57b4cec24530068"
}


db_instance_type = {
    "apac" : "t2.micro"
    "nordics":"t2.micro"
}

backend_instance_country=["apac","nordics"]

backend_instance_ami={
    "apac":"ami-0f57b4cec24530068"
    "nordics" : "ami-0f57b4cec24530068"
}


backend_instance_type = {
    "apac" : "t2.micro"
    "nordics":"t2.micro"
}

/* ecs_cluster_country = ["apac","nordics"] */
