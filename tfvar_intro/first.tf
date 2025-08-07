variable username{
    type=string
}

variable age{
    type=number
}


output "custom_hello"{
    value = "hello, ${var.username}, your age is ${var.age}"

}

