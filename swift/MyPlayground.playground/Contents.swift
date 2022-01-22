import Swift
import CoreGraphics

var name:String = "Jeonhui"
var age:Int = 23
var job:String = "IOS developer"
var height = 181.5
age = 99
job = "Writer"
print("\(type(of:height))")

var person:(name:String,age:Int,height:Double)=("f",1,1.1)
print(person)

var EmptyArray1:[Any] = [Any]()
var EmptyArray2:[Any] = Array<Any>()
print(EmptyArray1)
print(EmptyArray2)
