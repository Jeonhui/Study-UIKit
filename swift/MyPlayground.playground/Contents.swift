var numbers:[Int] = [1,2,3]

func nonReferenceParameter(_ arr:[Int]){
    var copiedArr: [Int]=arr
    copiedArr[1] = 1
}
func ReferenceParameter(_ arr: inout [Int]){
    arr[1] = 1
}

nonReferenceParameter(numbers)
print(numbers)
ReferenceParameter(&numbers)
print(numbers)
