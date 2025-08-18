//
//  StandardNavigationScrollView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI

struct StandardNavigationScrollView<Contents>: View where Contents: View {
    let title: String
    let backBtnConfig: (imageName: String, imageSize: CGSize, btnTap: () -> ())?
    @ViewBuilder var contents: Contents
    
    init(
        title: String,
        backBtnConfig: (imageName: String, imageSize: CGSize, btnTap: () -> ())? = ("chevron.backward", .init(width: 12, height: 22), {}),
        @ViewBuilder contents: @escaping () -> Contents
    ) {
        self.title = title
        self.backBtnConfig = backBtnConfig
        self.contents = contents()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LargeNavigationBar(title: self.title, backBtnConfig: self.backBtnConfig)
                .padding(.horizontal, 15)
            
            ScrollView {
                self.contents
                    .padding(.horizontal, 15)
            }
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    StandardNavigationScrollView(title: "테스트", backBtnConfig: nil){
        Text("123")
    }
}

