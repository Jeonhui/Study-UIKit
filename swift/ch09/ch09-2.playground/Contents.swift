struct BasicInformation{
    var name:String
    var age:Int
}

//변경 가능
var JeonhuiInfo: BasicInformation = BasicInformation(name: "Jeonhui", age: 99)

//변경 불가능
let JeonhuiAInfo: BasicInformation = BasicInformation(name: "Jeonhui", age: 99)
