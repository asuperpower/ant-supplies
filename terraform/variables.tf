variable "project_name" {
  type = string
}

variable "region" {
  type    = string
  default = "Australia Southeast"
}

variable "environment" {
  type = string
  # Typically not suggested but this is the only environment for this project
  default = "prod"
}
