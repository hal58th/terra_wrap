### The "bootstrap" product is solely responsible for bootstrapping the products.
The boostrap product is responsible for setting up the tfstate remote backend and other persistent changes.
This in turn will create it's own local tfstate file. You should commit that tfstate file to git.
Because it's a local tfstate file, make sure two people don't update it at the same time.

### Examples of things that the bootstrap should do:
- Create the remote backend for tfstate file.
- Creating AWS users.
- Setting up IAM roles, groups and permissions for those users.
- Anything that is persistent so that products can be brought up and deleted at whim.

### Workflow
The bootstrap product doees not use the `terra_wrap` command so you should run the usual terraform commands here.
```bash
terraform init
terraform apply
```
