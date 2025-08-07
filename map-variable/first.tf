variable usersage{
    type=map 
    default= {
        gaurav=20
        saurav=50
    }
}

output "userage"{
    value="my name is gaurav and my age is ${lookup(var.usersage,"gaurav")}"
}

output "userage2"{
    value="my name is saurav and my age is ${lookup(var.usersage,"saurav")}"
}