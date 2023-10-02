variable "region" {
    type    = string
    default = "ap-northeast-2"
}

variable "source_ami_id" {
    description = "Amazon Linux 2023 AMI(20230930)"
    type        = string
    default     = "ami-02288bc8778f3166f"
}

variable "instance_type" {
    type    = string
    default = "t3.micro"
}

variable "ami_name" {
    type    = string
    default = "AmazonLinux2023-Base"
}

variable "ssh_username" {
    type    = string
    default = "ec2-user"
}