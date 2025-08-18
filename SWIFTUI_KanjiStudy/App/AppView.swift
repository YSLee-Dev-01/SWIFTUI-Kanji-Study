//
//  AppView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    @State var store: StoreOf<AppFeature>
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    AppView(store: .init(initialState: .init(), reducer: {AppFeature()}))
}
