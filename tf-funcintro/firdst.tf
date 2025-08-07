output tolower{
    value = lower(var.username[0])
}

output toupper{
    value = upper(var.username[0])
}

output tojoin{
    value=join(",",["sreyas","tejas"])
}


# Terraform no longer requires or supports nested ${} syntax like: ${lower(${var.username[0]})}  ← INVALID
# PS C:\Users\Sreyas Tendulkar\Desktop\myrepos\tf-funcintro> terraform plan

# Changes to Outputs:
#   + tojoin  = "sreyas,tejas"
#   + tolower = "sreyas"
#   + toupper = "SREYAS"