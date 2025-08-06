output "custom_hello"{
    value = "hello, ${var.username}"

}
# interactive mode
# PS C:\Users\Sreyas Tendulkar\Desktop\myrepos\hello-variable> terraform plan
# var.username
#   Enter a value: sreyas


# Changes to Outputs:
#   + custom_hello = "hello, sreyas"



# non-interactive mode
# PS C:\Users\Sreyas Tendulkar\Desktop\myrepos\hello-variable> terraform plan -var "username=tejas"

# Changes to Outputs:
#   + custom_hello = "hello, tejas"