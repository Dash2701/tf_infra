aws_account_id="655694158741"
aws_region= "us-east-1"
vpc_cidr="10.18.0.0/16"
bastion_ami = {"unix" : "ami-048f6ed62451373d9"}
bastion_instance_type="t2.micro"
key_name="bastionKey"

db_instance_country=["us","ca"]

db_instance_ami={
    "us":"ami-048f6ed62451373d9"
    "ca" : "ami-048f6ed62451373d9"
}


db_instance_type = {
    "us" : "t2.micro"
    "ca":"t2.micro"
}

backend_instance_country=["us","ca"]

backend_instance_ami={
    "us":"ami-048f6ed62451373d9"
    "ca" : "ami-048f6ed62451373d9"
}


backend_instance_type = {
    "us" : "t2.micro"
    "ca":"t2.micro"
}

#ecs_cluster_country = ["apac","nordics"]
