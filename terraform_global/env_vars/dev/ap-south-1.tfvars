aws_account_id="655694158741"
aws_region= "ap-south-1"
vpc_cidr="10.18.0.0/16"
bastion_ami = {"unix" : "ami-0bcf5425cdc1d8a85"}
bastion_instance_type="t2.micro"
key_name="tuftiest"

db_instance_country=["apac","nordics"]

db_instance_ami={
    "apac":"ami-0bcf5425cdc1d8a85"
    "nordics" : "ami-0bcf5425cdc1d8a85"
}


db_instance_type = {
    "apac" : "t2.micro"
    "nordics":"t2.micro"
}

backend_instance_country=["apac","nordics"]

backend_instance_ami={
    "apac":"ami-0bcf5425cdc1d8a85"
    "nordics" : "ami-0bcf5425cdc1d8a85"
}


backend_instance_type = {
    "apac" : "t2.micro"
    "nordics":"t2.micro"
}

#ecs_cluster_country = ["apac","nordics"]
