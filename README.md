# Technical Test Buckhill

## **Architecture of EC2/Wordpress Instance with RDS:**

<p align="center">
<img src="https://i.ibb.co/kxbdmkF/1.png" />
</p>

**Note:**

-	All terraform resources are in N. Virginia (us-east-1)
-	RDS credentials must be omitted ans secured (eg: environmental variables). 
- **For testing purposes, we have used this credentials as terraform/ansible variables.**

This repository contains terraform and ansible code : 
- Terraform code will create :
  - VPC 
  - 2 subnets with two availability zones
  - DB subnet group 
  - 2 security groups with 4 rules for ec2 & rds db
  - RDS instance (mysql/db.t2.micro/20Gb)
  - EC2 instance (t2.micro) with key pair and EIP address
  - Internet Gateway
  - Route table & internet route associated with 2 subnets


- Ansible code will :
  - Update OS
  - Install Nginx/PHP/Wordpress
  - Configure Nginx & wordpress 
  - Connect EC2 instance to RDS instance 
  - Omit Nginx server token and PHP version
 

## Clone test-buckhill reposiroty 

cd ~

git clone https://github.com/GhassenMiled/test-buckhill.git

## Set credentials

### prerequisites 

- Valid AWS credentials
- Valid SSH public key.
- Install Terraform (The code was written for Terraform version 0.12 and above)
- Install Ansible (The code was written for ansible version 2.9.11)

### Source credentials 

Create .aws directory under $HOME, simply touch ~/.aws/credentials and provide your credentials:

    mkdir ~/.aws
    touch ~/.aws/credentials
    nano ~/.aws/credentials

    [default]
    aws_access_key_id=xxxxxxxxxxxxxxxxxxxxxx
    aws_secret_access_key=xxxxxxxxxxxxxxxxxxxxxx
    aws_session_token=xxxxxxxxxxxxxxxxxxxxxx

save the file and exit.

## Build the environment

## Step 1 : Terraform 

**Don't forget to verify your tfvars before building !!**

**Note :**

**- Provide your SSH public key**

    buckhill-test-key-pair-public-key = "ssh-rsa ..."

**- Check RDS Credentials (you can keep default values)**

    # Specify RDS informations
    buckhill-test-rds-db-name   = "mydb"
    buckhill-test-rds-user-name = "user"
    buckhill-test-rds-user-password  = "Azerty123456"

### Apply terraform

    cd ~/test-buckhill/terraform/
    terraform init 
    terraform plan
    terraform apply

## Step 2 : Ansible 

**Don't forget to verify your inventory and variables files !!**

**Note :**

**- Provide your EC2 EIP address in the inventory file (EIP is provided as terraform output)**

**- Check your private SSH key path**

    cd ~/test-buckhill/ansible/
    nano inv.d/inventory

    [webservers]
    X.Y.W.Z

    [all:vars]
    ansible_user=ubuntu
    ansible_ssh_private_key_file=~/.ssh/id_rsa

Change X.Y.W.Z with your EIP and save.

**- Provide your RDS Endpoint in the variables file (RDS Endpoint is provided as terraform output)**

    cd ~/test-buckhill/ansible/
    nano wp-rds-vars.yml

    wp_db_name: mydb
    wp_db_user: user
    wp_db_password: Azerty123456
    wp_db_host: terraform-xxx.xxx.rds.amazonaws.com


Change your wp_db_host with your rds endpoint (terraform-xxxx.xxx.rds.amazonaws.com)

Change wp_db_name, wp_db_user and wp_db_password. 

**These credentials must be the same in terraform.tfvars**

Save and exit.

### Run the playbook

    cd ~/test-buckhill/ansible/
    ansible-playbook playbook.yml


## Check the enviornement:

Open your browser and go to your EIP.

Choose the language and click Continue 

<p align="center">
<img src="https://i.ibb.co/gv7JV9G/2.png" />
</p>


Provide your informations and click Install Wordpress 
<p align="center">
<img src="https://i.ibb.co/vx4R76D/3.png" />
</p>

Next, Click Login and provide your credentials

<p align="center">
<img src="https://i.ibb.co/L0rtfH1/4.png" />
</p>

<p align="center">
<img src="https://i.ibb.co/QrdJ1pR/5.png" />
</p>

Now, you will be directed to your dashboard 

<p align="center">
<img src="https://i.ibb.co/gDZ38sn/6.png" />
</p>

<p align="center">
<img src="https://i.ibb.co/MhDygtq/7.png" />
</p>


**Now, Check that your PHP and Nginx versions are omitted.**

For Nginx, /etc/nginx/nginx.conf contains the parameter (server_tokens  off;)

For PHP, /etc/php/7.2/fpm/php.ini contains the parameter (expose_php = Off)


    curl -I <your_EIP>

<p align="center">
<img src="https://i.ibb.co/fDYc6hM/8.png" />
</p>

    curl -I <your_EIP/index.php>

<p align="center">
<img src="https://i.ibb.co/d4nytmk/9.png" />
</p>



## Destroy the environment
Once all previous steps are successful, you can destroy the environment and clear your credentials.

    cd ~/test-buckhill/terraform/
    terraform destroy 





