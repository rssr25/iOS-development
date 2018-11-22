func getMilk()
{
    //this fucking function brings your mum's milk bitch.
    print("got to the shops")
    print("buy 2 cartons of milk")
    print("pay $2")
    print("come home")

}


func getMilk(howManyMilkCartons : Int, whichShop : String)
{
    print("got to \(whichShop) shop")
    print("buy \(howManyMilkCartons) cartons of milk")
    let priceToPay = howManyMilkCartons * 2
    print("pay $\(priceToPay)")
    print("come home")
}

func getMilk(howManyMilkCartons : Int, whichShop : String, howMuchMoneyRobotWasGiven : Int) -> Int
{
    print("got to \(whichShop) shop")
    print("buy \(howManyMilkCartons) cartons of milk")
    let priceToPay = howManyMilkCartons * 2
    print("pay $\(priceToPay)")
    print("come home")
    let change = howMuchMoneyRobotWasGiven - priceToPay
    return change
}

var amountOfChange : Int = getMilk(howManyMilkCartons: 12, whichShop: "Shiela", howMuchMoneyRobotWasGiven: 50)
print("Hello master, here's your $\(amountOfChange) change")
