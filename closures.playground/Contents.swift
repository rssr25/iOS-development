import UIKit

func calculator(n1 : Int, n2 : Int, operation : (Int, Int) -> Int) -> Int
{
    return operation(n1, n2)
}

func add (no1 : Int, no2 : Int) -> Int
{
    return no1 + no2
}

func multiply(no1 : Int, no2 : Int) -> Int
{
    return no1 * no2
}



calculator(n1: 9, n2: 3, operation: multiply)


calculator(n1: 9, n2: 3, operation: add)

//closure type 1
calculator(n1: 10, n2: 10, operation: {
    (no1 : Int, no2 : Int) -> Int in
    
    return no1 * no2
})

//closure type 2
calculator(n1: 10, n2: 10, operation: {(no1, no2) -> Int in
    
    return no1 * no2
})

//closure type 3
calculator(n1: 10, n2: 10, operation: {(no1, no2) in
    
    return no1 * no2
})

//closure type 4
calculator(n1: 10, n2: 10, operation: {(no1, no2) in no1 * no2})

//closure type 5
var result = calculator(n1: 10, n2: 10, operation: {$0 * $1})
print(result)

//closure type 6
//training closure
result = calculator(n1: 10, n2: 10) {$0 * $1}
print(result)


//real life example for closure.
let array = [6, 2, 3, 9, 4, 1]
//we have to add a number to each of the elements of the array, the roundabout way is to use the
//for loop and iterate through each of the elements, but other way is using maps which simplifies this problem

func addOne(n1: Int) -> Int
    {
    return n1 + 1
}

array.map(addOne)

//using closures
print(array.map{$0 + 1})

