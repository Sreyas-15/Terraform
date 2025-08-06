output "custom_hello"{
    value = "hello, ${var.username}, your age is ${var.age}"

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




# made changes to variable to adjsut age variable with default value and pasing multiple perams via command line
# PS C:\Users\Sreyas Tendulkar\Desktop\myrepos\hello-variable> terraform plan -var "username=tejas" -var "age=22"

# Changes to Outputs:
#   + custom_hello = "hello, tejas, your age is 22"