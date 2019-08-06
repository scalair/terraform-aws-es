##################
# Security Group #
##################
variable "aws_security_group_es_tags" {
  description = "A map of tags to add to all resources."
  type        = map(string)
  default     = {}
}

####################
# VPC remote state #
####################
variable "vpc_bucket" {
  description = "Name of the bucket where vpc state is stored"
  type        = string
}

variable "vpc_state_key" {
  description = "Key where the state file of the VPC is stored"
  type        = string
}

variable "vpc_state_region" {
  description = "Region where the state file of the VPC is stored"
  type        = string
}

#######################
# Subnet remote state #
#######################
variable "subnet_bucket" {
  description = "Name of the bucket where subnet state is stored"
  type        = string
}

variable "subnet_state_key" {
  description = "Key where the state file of the subnet is stored"
  type        = string
}

variable "subnet_state_region" {
  description = "Region where the state file of the subnet is stored"
  type        = string
}

########################
# Elasticsearch Domain #
########################
variable "es_domain_name" {
  description = "Domain name for Elasticsearch cluster"
  type        = string
}

variable "es_elasticsearch_version" {
  description = "Version of Elasticsearch to deploy"
  type        = string
}

variable "es_instance_type" {
  description = "ES instance type for data nodes in the cluster (default t2.small.elasticsearch)"
  type        = string
}

variable "es_instance_count" {
  description = "Number of data nodes in the cluster"
  type        = number
}

variable "es_dedicated_master_enabled" {
  description = "Indicates whether dedicated master nodes are enabled for the cluster (default false)"
  type        = bool
  default     = false
}

variable "es_dedicated_master_type" {
  description = "ES instance type for master nodes in the cluster (default t2.small.elasticsearch)"
  type        = string
  default     = "t2.small.elasticsearch"
}

variable "es_dedicated_master_count" {
  description = "Number of data nodes in the cluster (default 3)"
  type        = number
  default     = 3
}

variable "es_ebs_volume_size" {
  description = "Optionally use EBS volumes for data storage by specifying volume size in GB (default 0)"
  type        = number
  default     = 0
}

variable "es_ebs_volume_type" {
  description = "Storage type of EBS volumes, if used (default gp2)"
  type        = string
  default     = "gp2"
}

variable "es_automated_snapshot_start_hour" {
  description = "Hour at which automated snapshots are taken, in UTC (default 0)"
  type        = number
  default     = 0
}

variable "es_tags" {
  description = "tags to apply to all resources"
  type        = map(string)
  default     = {}
}

variable "es_advanced_options" {
  description = "Map of key-value string pairs to specify advanced configuration options. Note that the values for these configuration options must be strings (wrapped in quotes) or they may be wrong and cause a perpetual diff, causing Terraform to want to recreate your Elasticsearch domain on every apply."
  type        = map(string)
  default     = {}
}

variable "es_log_publishing_enabled" {
  description = "Specifies whether given log publishing option is enabled or not."
  type        = bool
  default     = false
}

variable "es_log_publishing_log_type" {
  description = "A type of Elasticsearch log. Valid values: INDEX_SLOW_LOGS, SEARCH_SLOW_LOGS, ES_APPLICATION_LOGS"
  type        = string
  default     = "ES_APPLICATION_LOGS"
}

variable "es_log_publishing_cloudwatch_log_group_arn" {
  description = "ARN of the Cloudwatch log group to which log needs to be published."
  type        = string
  default     = ""
}
