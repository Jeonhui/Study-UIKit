//
//  ContentView.swift
//  SwiftUI_text
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct ContentView: View {
    
    static let dateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY년 MM월 dd일"
        //formatter.dateStyle = .long
        return formatter
    }()
    
    var today = Date()
    var trueOrFalse: Bool = false
    var number1: Int = 1
    
    var body: some View {
        VStack{
            Text("""
             WWDC22 resources and survey\nJune 10, 2022\nThank you to everyone who joined us for an amazing week. We hope you found value, connection, and fun. You can continue to: Watch sessions at any time.\nRead about newly announced technologies.\nGet sample code from sessions.\nPost on the Apple Developer Forums.We’d love to know what you thought of this year’s conference. If you’d like to tell us about your experience, please complete the WWDC22 survey.\nTake the survey\nthe survey
             """)
            .font(.system(.body, design: .rounded))
            .fontWeight(.medium)
            .multilineTextAlignment(.center)
            .lineLimit(10)
            .truncationMode(.tail)
            .shadow(color: .gray, radius: 1, x: 5, y: 5)
            .padding()
            .background(.yellow)
            .cornerRadius(20)
            .padding(20)
            .background(.orange)
            .padding(10)
            .lineSpacing(10)
            
            
            Text("안녕하세요!!")
                .background(Color.gray)
                .foregroundColor(Color.white)
            
            Text("오늘의 날짜 : \(today, formatter: ContentView.dateFormat)")
            Text("참 혹은 거짓 : \(String(trueOrFalse))")
            Text("숫자 : \(String(number1))")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
