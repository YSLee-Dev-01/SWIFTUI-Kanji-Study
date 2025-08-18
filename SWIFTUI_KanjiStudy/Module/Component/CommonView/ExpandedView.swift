//
//  ExpandedView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI

struct ExpandedView<Contents>: View where Contents: View {
    let alignment: HorizontalAlignment
    @ViewBuilder let view: () -> Contents
    
    var body: some View {
        HStack(spacing: 0) {
            if self.alignment != .leading {
                Spacer()
            }
            self.view()
            if self.alignment != .trailing {
                Spacer()
            }
        }
    }
}

