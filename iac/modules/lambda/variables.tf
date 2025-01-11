variable "name" {
  description = "The lambda function name"
  type        = string
  nullable    = false
}

variable "environment_variables" {
  type    = map(string)
  default = {}
}

variable "polices" {
  type    = list(string)
  default = null
}
