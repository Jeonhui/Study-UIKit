//
//  CircleImageView.swift
//  Image_tutorial
//
//  Created by 이전희 on 2022/06/22.
//

import SwiftUI

struct CircleImageView:View{
    @Binding
    var isActivated:Bool
    
    init(isActivated:Binding<Bool> = .constant(false)){
        _isActivated = isActivated
    }
    
    var body: some View{
        //        Image(systemName: "bolt.circle")
        //            .font(.system(size: 200))
        //            .foregroundColor(.yellow)
        //            .shadow(color: .gray, radius: 2, x: 5, y: 10)
        
        Image("myImage")
            .resizable()
            .scaledToFill()
            .frame(width:300,height: 300)
        //.aspectRatio(contentMode: .fill)
            .clipShape(RoundedRectangle(cornerRadius: (isActivated ? 500 : 100), style: .continuous))
            .shadow(color: .black, radius: 10, x: 5, y: 10)
            .overlay(RoundedRectangle(cornerRadius: (isActivated ? 500 : 100), style: .continuous)
                .foregroundColor(Color.black)
                .opacity((isActivated ? 0.4 : 0))
            )
            .overlay(RoundedRectangle(cornerRadius: (isActivated ? 500 : 100), style: .continuous)
                .stroke(Color.yellow, lineWidth: 5)
                .padding((isActivated ? 30 : 0))
            )
            .overlay(RoundedRectangle(cornerRadius: (isActivated ? 500 : 100), style: .continuous)
                .stroke(Color.red, lineWidth: 5)
                .padding((isActivated ? 20 : 0))
            )
            .overlay(RoundedRectangle(cornerRadius: (isActivated ? 500 : 100), style: .continuous)
                .stroke(Color.blue, lineWidth: 5)
                .padding((isActivated ? 10 : 0))
            )
            .overlay(
                Text("\(isActivated ? "홍지나 바보":"홍지나 주거")")
                    .foregroundColor((isActivated ? Color.white:Color.blue))
                    .font(.system(size: 40))
    
                    .fontWeight(.bold)
            )
    }
}


struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView()
    }
}
