# If you have multiple profiles in your ~/.oci/config file you can specify the profile to be used here
config_file_profile = "DEFAULT"

# Specify the disk size in GBs of the nodes in your cluster. Keep them <100 to stay within the Free Tier
ampere_boot_volume_size = 75

# If you want to use a different AZ to launch instances in you can specify it here. The AZs are automatically sourced into a data resource. All you need to do in input the index. You want the value to be 0, 1 or 2. 
availability_domain = 0

# The Public Key you want to add to the ~/.ssh/authorized_keys of the nodes
ssh_authorized_keys = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINdAjFIVuEXPP+mUqyKcLV/eA7A9jjGvkKA8ZFp2xNXz sol@sol-PC"

# The location of the Private key that will be used by Ansible to connect to the nodes 
ansible_ssh_private_key_file = "/home/sol/.ssh/root@oracle"