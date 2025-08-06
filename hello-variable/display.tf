output "custom_hello"{
    value = "hello, ${var.username}"

}
# PS C:\Users\Sreyas Tendulkar\Desktop\myrepos\hello-variable> terraform plan
# var.username
#   Enter a value: sreyas


# Changes to Outputs:
#   + custom_hello = "hello, sreyas"