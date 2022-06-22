import SwiftUI

struct MyTextView:View{
    
    @State
    private var index: Int = 0
    
    // 배경색 배열
    private let backgroundColors=[
        Color.red,
        Color.orange,
        Color.yellow,
        Color.green,
        Color.blue,
        Color.white
    ]
    
    var body: some View{
        VStack{
            Spacer()
            Text("배경 아이템 인덱스 \(index+1)")
                .font(.system(size: 30))
                .fontWeight(.semibold)
                .frame(minWidth:0, maxWidth: .infinity,minHeight:0,maxHeight: .infinity)
            
            Spacer()
        }.background(backgroundColors[index])
            .onTapGesture {
                withAnimation {
                    self.index = (index + 1)%backgroundColors.count
                    print("\(index) \(backgroundColors[index])")
                }
            }
        
    }
}

struct MyTextView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextView()
    }
}
