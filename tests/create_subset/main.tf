module service_linked_roles {
  source = "../../"

  aws_service_names = [
    "access-analyzer.amazonaws.com",
    "accountdiscovery.ssm.amazonaws.com",
    "appmesh.amazonaws.com",
    "appstream.application-autoscaling.amazonaws.com",
    "autoscaling-plans.amazonaws.com",
  ]
}
