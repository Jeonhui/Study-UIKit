import CoreGraphics
class Person {
    var height: Float = 0.0
    var weight: Float = 0.0
    
    deinit{
        print("소멸")
    }
}

var Jeonhui:Person? = .init()
Jeonhui = nil


