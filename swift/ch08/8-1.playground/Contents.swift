//var myName: String? = "Jeonhui"
//print(myName)
//
//myName = nil
//print(myName)
//
//public enum Optional<Wrapped>: ExpressibleByNilLiteral{
//    case none
//    case some(Wrapped)
//    public init(_ some: Wrapped){
//
//    }
//}

//func checkOptionalValue(value optionalValue: Any?){
//    switch optionalValue{
//    case .none:
//        print("optionalValue nil")
//    case .some(let value):
//        print("\(value)")
//    }
//}
//
//var myName:String?="a"
//checkOptionalValue(value: myName)
//myName = nil
//checkOptionalValue(value: myName)

let numbers:[Int?] = [2,nil,-4,nil,100]
for n in numbers{
    switch n{
    case .some(let value) where value < 0 :
        print("- \(value)")
    case .some(let value) where value > 10 :
        print("++ \(value)")
    case .some(let value):
        print("\(value)")
    case .none:
        print("nil")
    }
}

