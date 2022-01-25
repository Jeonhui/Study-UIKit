struct information{
    var name:String?
    var age:Int?
}
typealias i = information
var x:i = .init(name: "jeon", age: 23)
print((x.name)!)
