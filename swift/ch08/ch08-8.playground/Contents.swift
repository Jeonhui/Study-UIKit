var myName: String? = "Jeonhui"
var yourName: String? = nil

if let name = myName, let friend = yourName{
    print("\(name), \(friend)")
}

yourName = "eric"
if let name = myName, let friend = yourName{
    print("\(name), \(friend)")
}
