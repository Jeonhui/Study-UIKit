var myName: String? = "Jeonhui"
//옵셔널 바인딩
if let name = myName{
    print("\(name)")
}else{
    print("nil")
}

if var name = myName {
    name = "ajdajd"
    print("My name is \(name)")
}
else{
    print("nil")
}
