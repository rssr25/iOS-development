func calculateBMI(heightInMeters : Double, weightInKg : Double) -> String
{
    let BMI = weightInKg / (heightInMeters * heightInMeters)
    
    if BMI > 25
    {
        return "Your BMI is \(BMI), you fat fuck!"
    }
    else if BMI > 18.5 && BMI <= 25
    {
        return "Your BMI is \(BMI), you entitled fucker!"
    }
    else
    {
        return "Your BMI is \(BMI), you anorexic bitch!"
    }
    
}


var bmiCalc = calculateBMI(heightInMeters: 1.73, weightInKg: 60)
print(bmiCalc)
