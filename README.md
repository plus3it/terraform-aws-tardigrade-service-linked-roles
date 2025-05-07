# terraform-aws-tardigrade-service-linked-roles

Terraform module to manage AWS IAM Service-linked roles

The defaults for this module will create _all_ known service-linked roles,
except for the special cases described below. These special cases are
excluded by default. It is possible to manage them (or _attempt_ to manage
them), by removing them when passing `var.excluded_aws_service_names`.

Many service-linked roles may be created through other means, before applying
this module. To manage these roles with this module, import them into the terraform
state using the service principal name and the role arn:

```
$ terraform import 'aws_iam_service_linked_role.this["organizations.amazonaws.com"]' arn:aws:iam::123456789012:role/aws-service-role/organizations.amazonaws.com/AWSServiceRoleForOrganizations
```

## Special cases

### Service-linked roles that cannot be deleted

Some service-linked roles, once created, cannot be deleted, including:

* `replicator.lambda.amazonaws.com`

### Service-linked roles with flaky delete support

Some service-linked roles exhibit flaky behavior when being deleted. Sometimes
it works, sometimes it does not. These include:

* `codeguru-profiler.amazonaws.com`
* `elasticfilesystem.amazonaws.com`
* `fsx.amazonaws.com`
* `networkmanager.amazonaws.com`

### Service-linked roles generally created by AWS Organizations

* `ssm.amazonaws.com`
* `cloudtrail.amazonaws.com`
* `fms.amazonaws.com`
* `organizations.amazonaws.com`
* `sso.amazonaws.com`
* `support.amazonaws.com`
* `transitgateway.amazonaws.com`
* `trustedadvisor.amazonaws.com`

## Testing

Manual testing:

```
# Replace "xxx" with an actual AWS profile, then execute the integration tests.
export AWS_PROFILE=xxx 
make terraform/pytest PYTEST_ARGS="-v --nomock"
```

For automated testing, PYTEST_ARGS is optional and no profile is needed:

```
make mockstack/up
make terraform/pytest PYTEST_ARGS="-v"
make mockstack/clean
```

<!-- BEGIN TFDOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Resources

| Name | Type |
|------|------|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_service_names"></a> [aws\_service\_names](#input\_aws\_service\_names) | List of AWS Service Names for which service-linked roles will be created | `list(string)` | <pre>[<br/>  "access-analyzer.amazonaws.com",<br/>  "accountdiscovery.ssm.amazonaws.com",<br/>  "appmesh.amazonaws.com",<br/>  "appstream.application-autoscaling.amazonaws.com",<br/>  "autoscaling-plans.amazonaws.com",<br/>  "cassandra.application-autoscaling.amazonaws.com",<br/>  "chime.amazonaws.com",<br/>  "cks.kms.amazonaws.com",<br/>  "cloud9.amazonaws.com",<br/>  "cloudhsm.amazonaws.com",<br/>  "cloudtrail.amazonaws.com",<br/>  "cloudwatch-crossaccount.amazonaws.com",<br/>  "codeguru-profiler.amazonaws.com",<br/>  "codeguru-reviewer.amazonaws.com",<br/>  "codestar-notifications.amazonaws.com",<br/>  "compute-optimizer.amazonaws.com",<br/>  "config.amazonaws.com",<br/>  "connect.amazonaws.com",<br/>  "continuousexport.discovery.amazonaws.com",<br/>  "dax.amazonaws.com",<br/>  "ecs.amazonaws.com",<br/>  "eks-nodegroup.amazonaws.com",<br/>  "eks.amazonaws.com",<br/>  "elasticache.amazonaws.com",<br/>  "elasticbeanstalk.amazonaws.com",<br/>  "elasticfilesystem.amazonaws.com",<br/>  "elasticloadbalancing.amazonaws.com",<br/>  "elasticmapreduce.amazonaws.com",<br/>  "email.cognito-idp.amazonaws.com",<br/>  "es.amazonaws.com",<br/>  "fms.amazonaws.com",<br/>  "fsx.amazonaws.com",<br/>  "globalaccelerator.amazonaws.com",<br/>  "guardduty.amazonaws.com",<br/>  "inspector.amazonaws.com",<br/>  "iotsitewise.amazonaws.com",<br/>  "lakeformation.amazonaws.com",<br/>  "lex.amazonaws.com",<br/>  "logger.cloudfront.amazonaws.com",<br/>  "macie.amazonaws.com",<br/>  "maintenance.elasticbeanstalk.amazonaws.com",<br/>  "managedupdates.elasticbeanstalk.amazonaws.com",<br/>  "management.chatbot.amazonaws.com",<br/>  "networkmanager.amazonaws.com",<br/>  "opensearchservice.amazonaws.com",<br/>  "ops.apigateway.amazonaws.com",<br/>  "organizations.amazonaws.com",<br/>  "rds.amazonaws.com",<br/>  "redshift.amazonaws.com",<br/>  "replicator.lambda.amazonaws.com",<br/>  "robomaker.amazonaws.com",<br/>  "securityhub.amazonaws.com",<br/>  "sms.amazonaws.com",<br/>  "ssm.amazonaws.com",<br/>  "sso.amazonaws.com",<br/>  "support.amazonaws.com",<br/>  "transitgateway.amazonaws.com",<br/>  "trustedadvisor.amazonaws.com",<br/>  "voiceconnector.chime.amazonaws.com",<br/>  "wafv2.amazonaws.com",<br/>  "worklink.amazonaws.com"<br/>]</pre> | no |
| <a name="input_excluded_aws_service_names"></a> [excluded\_aws\_service\_names](#input\_excluded\_aws\_service\_names) | List of AWS Service Names for which service-linked roles will *NOT* be created | `list(string)` | <pre>[<br/>  "cloudtrail.amazonaws.com",<br/>  "codeguru-profiler.amazonaws.com",<br/>  "elasticfilesystem.amazonaws.com",<br/>  "fms.amazonaws.com",<br/>  "fsx.amazonaws.com",<br/>  "networkmanager.amazonaws.com",<br/>  "organizations.amazonaws.com",<br/>  "replicator.lambda.amazonaws.com",<br/>  "ssm.amazonaws.com",<br/>  "sso.amazonaws.com",<br/>  "support.amazonaws.com",<br/>  "transitgateway.amazonaws.com",<br/>  "trustedadvisor.amazonaws.com"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_iam_service_linked_roles"></a> [iam\_service\_linked\_roles](#output\_iam\_service\_linked\_roles) | Map of IAM Service-linked role objects |

<!-- END TFDOCS -->
