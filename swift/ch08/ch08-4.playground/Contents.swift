func checkOptionalValue(value optionalValue: Any?){
    switch optionalValue{
    case .none:
        print("This Optional variable is nil")
    case .some(let value):
        print("Value is \(value)")
    }
}

var myName: String? = "yagom"
checkOptionalValue(value: myName)

myName = nil
checkOptionalValue(value: myName)
