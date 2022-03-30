//
//  TrailingIconLabelStyle.swift
//  scrumdinger
//
//  Created by 이전희 on 2022/03/30.
//

import Foundation
import SwiftUI

struct TrailingIconLabelStyle:LabelStyle{
    func makeBody(configuration:Configuration) -> some View {
        HStack{
            configuration.title
            configuration.icon
        }
    }
}

extension LabelStyle where Self == TrailingIconLabelStyle{
    static var trailingIcon: Self { Self() }
}
