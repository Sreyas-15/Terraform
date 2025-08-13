variable "services" {
  type = map(number)
  default = {
    SSH   = 22
    HTTP  = 80
    HTTPS = 443
    MYSQL = 3306
    REDIS = 6379
  }
}

variable "instance_type" {
  type = string
}