func crashAndBurn()->Never{
    fatalError("Something very, very bad happend")
}


func someFunction(_ isAllIsWell: Bool){
    guard isAllIsWell else{
        print("마을에 도둑")
        crashAndBurn()
    }
    print("All is Well")
}

someFunction(true)


