//
//  StandardNavigationScrollView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI

struct StandardNavigationScrollView<Contents>: View where Contents: View {
    let title: String
    let backBtnConfig: (imageName: String, imageSize: CGSize)?
    let backBtnConfigAction: (() -> Void)?
    
    @ViewBuilder var contents: Contents
    
    init(
        title: String,
        backBtnConfig: (imageName: String, imageSize: CGSize)? = ("chevron.backward", .init(width: 9, height: 18)),
        backBtnConfigAction: (() -> ())? = nil,
        @ViewBuilder contents: @escaping () -> Contents
    ) {
        self.title = title
        self.backBtnConfig = backBtnConfig
        self.backBtnConfigAction = backBtnConfigAction
        self.contents = contents()
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            LargeNavigationBar(title: self.title, backBtnConfig: self.backBtnConfig, backBtnConfigAction: self.backBtnConfigAction)
            
            ScrollView {
                self.contents
                    .padding(.horizontal, 20)
            }
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    StandardNavigationScrollView(title: "테스트", backBtnConfig: nil){
        Text("123")
    }
}

