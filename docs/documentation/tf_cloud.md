Set up Terraform Cloud integration.

- Create account on terraform cloud
- Create organisation (devops-boot in our case)
- Set up team
- Create Workspace
  - out workflow has several workspaces
    - provisioning-preprod
    - deployments-preprod
    - provisioning-prod
    - deployments-prod
- Create variables under each workspace:
  - AWS_ACCESS_KEY_ID
  - AWS_SECRET_ACCESS_KEY (mark it as sensitive)
  This will enable Terraform Cloud to connect to your AWS account and create resources

- Under the workspace settings -> General -> specify the "Terraform Working Directory"

for provisioning-preprod:
terraform/provisioning/preprod
deployments-preprod:
terraform/deployments/preprod
etc.
This is the folder where Terraform Cloud will look for the configuration files.

- Create a Team token under workspaces -> Settings -> Teams -> Team API token.
  - Add this token to Github Actions as secret.
    In Github repository -> Settings -> Secrets -> Actions -> Create TF_API_TOKEN

Now Terraform Cloud is ready to get API requests from Github and Github knows how to reach Terraform Cloud.

Create the Github Actions files as shown in this PR:
https://github.com/DevOps-Boot/fastapi-k8s/pull/76/files

Create any additional files for other environments as see fit.

Live happily ever after!