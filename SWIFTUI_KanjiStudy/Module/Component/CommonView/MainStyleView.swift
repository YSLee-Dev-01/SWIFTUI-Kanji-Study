//
//  MainStyleView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI

struct MainStyleView<Contents>: View where Contents: View {
    @ViewBuilder var contents: Contents
    
    var body: some View {
        self.contents
            .background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.gray.opacity(0.1))
            }
    }
}
