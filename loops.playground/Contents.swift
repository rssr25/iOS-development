import UIKit

let arrayOfNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
var sum : Int = 0

for number in arrayOfNumbers
{
    sum += number
}

print ("Sum = \(sum)")


for number in 1 ... 10
{
    print(number)
}


//open range
for number in 1 ..< 10
{
    print(number)
}

//condition
for number in 1 ..< 10 where number % 2 == 0
{
    print(number)
}


lyrics of a song

for number in (1 ..< 100).reversed()
{
    print("\(number) bottles of beer on the wall, \(number) bottles of beer. \n Take one down and pass it around, \(number - 1) bottles of beer on the wall.\n\n")
}

func beerSong(forThisManyBottlesOfBeer totalNumberOfBottles : Int) -> String
{
    var lyrics : String = ""
    
    for number in (1 ... totalNumberOfBottles).reversed()
    {
        let newLine : String = "\(number) bottles of beer on the wall, \(number) bottles of beer. \n Take one down and pass it around, \(number - 1) bottles of beer on the wall.\n\n"
        
        lyrics += newLine
    }
    
    lyrics += "No more bottles of beer on the wall, no more bottles of beer. \n Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    
    return lyrics
}

print(beerSong(forThisManyBottlesOfBeer : 1000))
