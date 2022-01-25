typealias MoveFunc = (Int)->Int

func functionForMove(_ shouldGoLeft: Bool)->MoveFunc{
    func goRight(_ currentPosition: Int)->Int{
        return currentPosition + 1
    }
    func goLeft(_ currentPosition: Int)->Int{
        return currentPosition - 1
    }
    
    return shouldGoLeft ? goLeft : goRight
}

var position: Int = -4
let moveToZero: MoveFunc = functionForMove(position>0)

while position != 0{
    print("\(position)...")
    position = moveToZero(position)
}
