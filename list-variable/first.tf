variable users{
    type = list
}

output printfirstuser{
    value = "The first user is ${var.users[0]}"
}

#enforce a list for users varibale can be used for multiple security groups and display first user
# PS C:\Users\Sreyas Tendulkar\Desktop\myrepos\list-variable> terraform plan 
# var.users
#   Enter a value: ["sreyas","shama","tejas"]
# Changes to Outputs:
#   + printfirstuser = "The first user is sreyas"



