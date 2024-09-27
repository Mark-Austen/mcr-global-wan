This example deploys the Megaport Cloud Router (MCR) in five global locations and a full mesh private network between all locations using Megaports private backbone. The following resources are deployed:

* 5 x 1Gbps Megaport Cloud Router in the following locations:
  * Sydney
  * Melbourne
  * Perth
  * Auckland
  * Singapore
* 1 x 1Gbps Private VXC between all locations

### Prerequisites

* Install Terraform locally on Mac, Linux, or Windows: [Link](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/install-cli)
* Create Megaport API Key: [Link](https://docs.megaport.com/api/api-key/)

### Deployment Instructions

* Download or Clone this Terraform example.
* Modify the provider.tf file with your own Megaport API Key/API Key Secret.
* Set the Megaport environment in provider.tf - this example can be deployed completely in the staging environment.
* From the command line change to the directory containing the Terraform files.
* Run `terraform init` to initialise Terraform and the providers.
* Run `terraform apply` to deploy this example.

### Notes

* When you have completed, use `terraform destroy` so that you will stop incurring costs for the resources (if deployed in production).

### Testing

* The staging environment simulates deployment of Megaport services only, services are not real and do not run live traffic.
* To test with live services deploy in the production environment.
