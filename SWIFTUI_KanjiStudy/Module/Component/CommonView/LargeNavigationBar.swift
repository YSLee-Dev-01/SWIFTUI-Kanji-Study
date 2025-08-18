//
//  LargeNavigationBar.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI

struct LargeNavigationBar: View {
    let title: String
    let backBtnConfig: (imageName: String, imageSize: CGSize, btnTap: () -> ())?
    
    init(title: String, backBtnConfig: (imageName: String, imageSize: CGSize, btnTap: () -> ())? = ("chevron.backward", .init(width: 12, height: 22), {})) {
        self.title = title
        self.backBtnConfig = backBtnConfig
    }
    
    var body: some View {
        HStack(alignment: .center) {
            if let backBtnConfig = self.backBtnConfig {
                Image(systemName: backBtnConfig.imageName)
                    .resizable()
                    .foregroundColor(.black)
                    .frame(width: backBtnConfig.imageSize.width, height:  backBtnConfig.imageSize.height)
                    .padding(.trailing, 10)
                    .onTapGesture {
                        backBtnConfig.btnTap()
                    }
            }
            Text(self.title)
                .font(.title)
                .fontWeight(.bold)
            
            Spacer()
        }
    }
}

#Preview {
    LargeNavigationBar(title: "테스트", backBtnConfig: nil)
}
