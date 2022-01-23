prefix operator **
prefix func ** (value: Int)->Int{
    return value * value
}

let minusFive: Int = -5
let sqrtMunusFive: Int = **minusFive
print(sqrtMunusFive)

prefix func ! (value: String)->Bool{
    return value.isEmpty
}

var stringValue = "Jeonhui"
var isEmptyString: Bool = !stringValue
print(isEmptyString)
stringValue = ""
print(!stringValue)
