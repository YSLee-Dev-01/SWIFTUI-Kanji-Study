//
//  MainStyleView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI

struct MainStyleView<Contents>: View where Contents: View {
    let cornerRadius: CGFloat
    @ViewBuilder var contents: Contents
    
    init(cornerRadius: CGFloat = 15,  @ViewBuilder contents: @escaping () -> Contents) {
        self.cornerRadius = cornerRadius
        self.contents = contents()
    }
    
    var body: some View {
        self.contents
            .background {
                RoundedRectangle(cornerRadius: self.cornerRadius)
                    .fill(Color.gray.opacity(0.1))
            }
    }
}
