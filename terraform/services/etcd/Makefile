##
# etcd cluster 
#
# @file
# @version 0.1
#

FLAGS=-var-file common.tfvars -var-file service.tfvars

init:
	if ls .terraform 1> /dev/null 2>&1; then rm -rf .terraform; rm -rf .terraform.lock.hcl; fi
	if ls common* 1> /dev/null 2>&1; then rm -rf common*; fi
	cp -R ../commons/* .
	terraform init

plan:
	if ls common* 1> /dev/null 2>&1; then rm -rf common*; fi
	cp -R ../commons/* .
	terraform plan $(FLAGS) 

apply:
	if ls common* 1> /dev/null 2>&1; then rm -rf common*; fi
	cp -R ../commons/* .
	terraform apply $(FLAGS) 
	if ls common* 1> /dev/null 2>&1; then rm -rf common*; fi

destroy:
	if ls common* 1> /dev/null 2>&1; then rm -rf common*; fi
	cp -R ../commons/* .
	terraform destroy $(FLAGS) 
	if ls common* 1> /dev/null 2>&1; then rm -rf common*; fi



clean:
	if ls common* 1> /dev/null 2>&1; then rm -rf common*; fi
# end
