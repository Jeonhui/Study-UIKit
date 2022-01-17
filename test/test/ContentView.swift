import SwiftUI

struct ContentView: View {
    @State var clickCheck = false
    var body: some View {
        Button(action:{
            self.clickCheck.toggle()
        }){
            Text("btn?")
        }
        if self.clickCheck{
            Text("btn")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
