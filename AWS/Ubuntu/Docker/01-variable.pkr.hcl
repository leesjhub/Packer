variable "region" {
  type    = string
  default = "ap-northeast-2"
}

variable "source_ami_id" {
  description = "Ubuntu Server 22.04 LTS (HVM), SSD Volume Type / Ubuntu Server 22.04 LTS (HVM),EBS General Purpose (SSD) Volume Type. Support available from Canonical (http://www.ubuntu.com/cloud/services)."
  type        = string
  default     = "ami-0c9c942bd7bf113a2"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_name" {
  type    = string
  default = "Ubuntu-Server-2204-Base"
}

variable "ssh_username" {
  type    = string
  default = "ubuntu"
}