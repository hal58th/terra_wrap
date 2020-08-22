## The terraform wrapper script - `terra_wrap`
Terraform does not manage environments in a great way.
You almost always have to supply a "var-file" and sometimes a "backend-config" file.
This is where the `terra_wrap` wrapper script to the `terraform` command comes in.
It was written to simplify having multiple environments and make less mistakes.

Running the command:
```bash
terra_wrap qa apply
```
Runs the following commands:
```bash
terraform init -backend-config env/qa.backend.tfvars -reconfigure
terraform apply -var-file env/qa.tfvars -input=false
```

#### Help File of `terra_wrap`
```bash
Usage: terra_wrap <environment> <apply|output|destroy|plan|apply-plan|destroy-jenkins>

Typically you would only use the options 'apply, output or destroy'.
Example: 'terra_wrap qa apply' and 'terra_wrap qa destroy'

Environments, for example: qa, prod. You can add additional environments by adding variable files.

Options:
  apply: Used by Developers - It will both 'init' the backend and 'apply' your changes. It will create the environment if it does not exist.
  output: Used by Developers - Exact same as 'terraform output' which will show you all outputs in this directory.
  destroy: Used by Developers - Destroys the entire environment specified but will prompt first.
  console: Used by Developers - Test your expressions against that environments variable file.
  plan: Used by Jenkins - Creates a plan file that you can 'apply' at a later date.
  apply-plan: Used by Jenkins - Applies a plan without any prompt.
  destroy-jenkins: Used by Jenkins - Destroys the environment without any prompt.
```

## Typical workflow
If you are following this repo layout, then first you need change directory into the product you are working on and then run the `terra_wrap` command:
```bash
cd product/product_foo
terra_wrap qa apply
```
Additionally, before you create a PR, you should format all the Terraform files.
This can be done by running `make format` in the `terraform` directory.
When you don't want the environment anymore, just run destroy.
```
terra_wrap qa destroy
``` 

## Running Terraform
Using this repo layout, you don't need to install Terraform to run it.
A custom docker container is created to help control the Terraform version and lets you add any software you wish.
You will build and run the docker container by running the command:
```bash
make run
```
If you use an IDE to write your code, you will still have to install Terraform.

## Setting up AWS Credentials (If using AWS)
[First you must install the aws cli client.](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2-mac.html)
```
```bash
aws configure --profile (PROFILE-NAME)
```
This will prompt you for your secret access key. [Where to get your secret access key.](https://docs.aws.amazon.com/general/latest/gr/aws-sec-cred-types.html#access-keys-and-secret-access-keys)

