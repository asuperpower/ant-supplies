# Ant supplies
Site source for ant.supplies

## Toolchain
* Static side made in react + typescript. Kept pretty simple.
* Infra made with terraform and deploys the static site to an azure storage account.

## Developing
Can use yarn locally (`yarn start` etc.)
Can use `terraform init`, `terraform plan`, etc. to test the infra

## Deploying
On push to main, terraform picks up a change and automatically plans and applies the terraform infrastructure. It is deployed to the infrastructure in a github action via a AAD service principal.
