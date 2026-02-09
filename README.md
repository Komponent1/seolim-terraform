# Simple AWS infra Terraform

### prepare

1. aws cli, terraform 설치

2. terraform.tfvars 작성

### RUN

```
terraform init
terraform validate
terraform plan
terraform apply
```

### After apply

1. 도메인 설정(ACM, Route53, ALB Listner 추가)

### Additional

DB 암호화 원할 시 rds.tf에 아래 추가

```hcl
storage_encrypted = true
```

### Architecture

![img](https://raw.githubusercontent.com/Komponent1/server/refs/heads/master/etc/Blank%20diagram.png)
