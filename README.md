## Provisioning and configuring infrastructure using Terraform and Ansible on Digital Ocean

Prerequisites:  
Have an account on Digital Ocean cloud provider.  
Terraform and Ansible installed on Ubuntu OS

 ### TERRAFORM

 Step 1: Install Terraform on Ubuntu

 Step 2: Create a main.tf file

 Step 3: Initializes a working directory for Terraform
Execute on terminal the following command:

    terraform init

 Step 4: As a best practice set the Digital Ocean token into an environment variable
Execute on terminal the following command:

    export TF_VAR_do_token=”YOURDIGITALOCEANTOKENHERE”

 Step 5: Get your ssh key id for use in the configuration file
Execute on terminal the following command:

    curl -X GET -H "Content-Type: application/json" -H "Authorization: Bearer $YOURDIGITALOCENTOKENHERE" "https://api.digitalocean.com/v2/account/keys"

 Step 6: Apply the configuratión
Execute on terminal the following command:

    terraform apply   

### ANSIBLE    

 Step 7: Install Ansible on Ubuntu

 Step 8: Create host file and add the ips of your worker servers

 Step 9: Create play.yaml playbook file

 Step 10: Create ansible.cfg file

 Step 11: Add into the Ansible machine the target hosts
Execute on terminal the following command:

    ssh-keyscan -H “iptargetserver” >> ~/.ssh/known_hosts

 Step 12: Send and execute the configuration to the worker servers
Execute on terminal the following command:

    ansible-playbook -i hosts play.yaml   