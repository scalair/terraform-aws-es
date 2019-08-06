resource "aws_security_group" "es" {
  description = "ElasticSearch SG"
  vpc_id      = data.terraform_remote_state.vpc.outputs.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.aws_security_group_es_tags
}


resource "aws_iam_service_linked_role" "es" {
  aws_service_name = "es.amazonaws.com"
}

resource "aws_elasticsearch_domain" "es" {
  domain_name           = var.es_domain_name
  elasticsearch_version = var.es_elasticsearch_version

  cluster_config {
    instance_type  = var.es_instance_type
    instance_count = var.es_instance_count

    dedicated_master_enabled = var.es_dedicated_master_enabled
    dedicated_master_type    = var.es_dedicated_master_type
    dedicated_master_count   = var.es_dedicated_master_count

    zone_awareness_enabled = true
    zone_awareness_config {
      availability_zone_count = length(data.terraform_remote_state.subnet.outputs.private_subnets)
    }
  }

  vpc_options {
    subnet_ids         = data.terraform_remote_state.subnet.outputs.private_subnets
    security_group_ids = [aws_security_group.es.id]
  }

  advanced_options = var.es_advanced_options

  log_publishing_options {
    enabled                  = var.es_log_publishing_enabled
    log_type                 = var.es_log_publishing_log_type
    cloudwatch_log_group_arn = var.es_log_publishing_cloudwatch_log_group_arn
  }

  ebs_options {
    ebs_enabled = true
    volume_type = var.es_ebs_volume_type
    volume_size = var.es_ebs_volume_size
  }

  access_policies = <<CONFIG
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": "es:*",
            "Principal": "*",
            "Effect": "Allow",
            "Resource": "arn:aws:es:${data.aws_region.current.name}:${data.aws_caller_identity.current.account_id}:domain/${var.es_domain_name}/*"
        }
    ]
}
CONFIG

  snapshot_options {
    automated_snapshot_start_hour = var.es_automated_snapshot_start_hour
  }

  tags = var.es_tags

  depends_on = [
    "aws_iam_service_linked_role.es",
  ]
}