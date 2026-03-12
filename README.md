# AWS via Terraform and CI/CD

## Overview
This is a repo of a passion/challenge project for me where I will be taking a couple of AWS courses and create my own AWS infrastructure from scratch.\
But there is a catch, these courses do not mention or involve any Terraform or CI/CD pipelines.\
The challenge here is whatever projects the courses take me through, I will be adding a layer of challenge and only deploy it via IaC with an automated pipeline rather than the AWS console.\
This is so I keep my DevOps skills sharp as well as improve on anything that is lacking.

After these courses are done I may then go for the AWS certifications but that's only a bonus, the real goal is creating a living and breathing AWS environment.

This will be the public repo where things made are simply templates. 

The repo has been set up to follow CI/CD practices.

Deployment workflow is as follows:\
Push feature branch -> PR to main -> Plan on Dev Account -> Merge on Main -> Deploy Main to Dev Account -> \
tag Main -> Plan tag on Prod Account -> Manual Approval -> Deploy tag to Prod Account

This Repo remains work in progress. 