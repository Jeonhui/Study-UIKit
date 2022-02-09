var myName: String? = "Jeonhui"
var jeonhui: String = myName!

//myName = nil
//jeonhui = myName 에러

if myName != nil{
    print("\(myName)")
    print("\(jeonhui)")
}else{
    print("nil")
}

