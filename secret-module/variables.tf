variable "project" {
  type = string
}

variable "secret_names" {
  type = set(string)
}

variable "access_members" {
  type = list(string)
}

variable "labels" {
  type = map
}
