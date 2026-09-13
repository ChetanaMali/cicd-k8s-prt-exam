variable "aws_region" {
  description = "AWS region to deploy in"
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  description = "Ubuntu 22.04 AMI ID for your chosen region"
  type        = string
  default     = "ami-0f5ee92e2d63afc18" # Ubuntu 22.04 LTS, ap-south-1 (Mumbai) - verify current AMI ID before use
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium" # k8s needs at least 2 vCPU / 2GB+ RAM
}

variable "key_name" {
  description = "Existing AWS key pair name for SSH access"
  type        = string
  default     = "your-key-pair-name" # <-- change this
}
