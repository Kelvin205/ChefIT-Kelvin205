resource "aws_elastic_beanstalk_application" "chefit_app" {
  name        = "chefit-${var.github_username}"
  description = "ChefIt App deployed via Terraform"
}

resource "aws_elastic_beanstalk_environment" "chefit_env" {
  name                = "chefit-env-${var.github_username}"
  application         = aws_elastic_beanstalk_application.chefit_app.name
  solution_stack_name = "64bit Amazon Linux 2 v3.5.0 running Python 3.8"

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    value     = "aws-elasticbeanstalk-ec2-role"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "SingleInstance"
  }

  cname_prefix = "chefit-${var.github_username}"
}