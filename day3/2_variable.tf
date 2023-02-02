variable "x" {
  type = string
  default = "Hello World"
}

output "myvalue" {
    value = "${var.x}"
  
}