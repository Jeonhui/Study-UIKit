//
//  ContentView.swift
//  Calculator
//
//  Created by 이전희 on 2022/02/21.
//

import SwiftUI

enum CalculatorButton: String{
    case zero, one, two, three, four, five, six, seven, eight, nine, decimal
    case equals, plus, minus, multiply, divide
    case ac, plusMinus, percent
    
    var title: String{
        switch self {
        case .zero: return "0"
        case .one: return "1"
        case .two: return "2"
        case .three: return "3"
        case .four: return "4"
        case .five: return "5"
        case .six: return "6"
        case .seven: return "7"
        case .eight: return "8"
        case .nine: return "9"
        case .decimal: return "."
        case .equals: return "="
        case .plus: return "+"
        case .minus: return "-"
        case .multiply: return "X"
        case .divide: return "/"
        case .ac: return "AC"
        case .plusMinus: return "+-"
        case .percent: return "%"
        }
        
    }
    
    var backgroundColor: Color{
        switch self {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine, .decimal:
            return Color(.darkGray)
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        default:
            return .orange
        }
    }
}

//Env object
class GlobalEnvironment:ObservableObject{
    @Published var display : String = ""
    
    var save: String = ""
    
    func receiveInput(button: CalculatorButton){
        switch button {
        case .zero, .one, .two, .three, .four, .five, .six, .seven, .eight, .nine,.decimal:
            display = display + button.title
        case .equals:
            save = display
            display = ""
        case .plus: display = display + button.title
            save = display
            display = ""
        case .minus: display = display + button.title
            save = display
            display = ""
        case .multiply: display = display + button.title
            save = display
            display = ""
        case .divide: display = String((display as NSString).floatValue)
        case .ac: display = ""
        case .plusMinus: display = isFloat(num: String((display as NSString).floatValue * -1))
        case .percent: display = isFloat(num: String((display as NSString).floatValue / 100))
        }
    }
    
    func isFloat(num:String) -> String {
        var numP:[String.SubSequence]
        numP = num.split(separator: ".")
        if Int(numP[1]) != 0{
            return num
        }else{
            return String(numP[0])
        }
    }
    
}

struct ContentView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    let buttons:[[CalculatorButton]] = [
        [.ac,.plusMinus,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.minus],
        [.one,.two,.three,.plus],
        [.zero,.decimal,.equals],
    ]
    
    
    var body: some View {
        ZStack(alignment: .bottom){
            Color.black.edgesIgnoringSafeArea(.all)
            VStack (spacing:12){
                
                HStack{
                    Spacer()
                    Text("\(env.display)")
                        .foregroundColor(.white)
                        .font(.system(size: 64))
                }.padding()
                
                ForEach(buttons, id: \.self){ row in
                    HStack (spacing:12){
                        ForEach(row, id: \.self){ button in
                            CalculatorbuttonView(button: button)
                        }
                    }
                }
            }.padding(.bottom)
        }
    }
    
}

struct CalculatorbuttonView:View{
    var button: CalculatorButton
    @EnvironmentObject var env: GlobalEnvironment
    var body: some View{
        Button {
            env.receiveInput(button: button)
        } label: {
            Text(button.title)
                .font(.system(size:32))
                .frame(width:self.buttonWidth(button: button), height:  (UIScreen.main.bounds.width - 5 * 12)/4)
                .foregroundColor(Color.white)
                .background(button.backgroundColor)
                .cornerRadius(self.buttonWidth(button: button))
        }
    }
    private func buttonWidth(button: CalculatorButton) ->CGFloat{
        if button != .zero{
            return (UIScreen.main.bounds.width - 5 * 12)/4
        }else{
            return (UIScreen.main.bounds.width - 4 * 12)/4 * 2
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(GlobalEnvironment())
    }
}
