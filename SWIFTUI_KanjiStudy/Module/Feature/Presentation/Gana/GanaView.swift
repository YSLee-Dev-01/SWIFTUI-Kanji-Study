//
//  GanaView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

struct GanaView: View {
    @State private var store: StoreOf<GanaFeature>
    
    init(store: StoreOf<GanaFeature>) {
        self.store = store
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    GanaView(store: .init(initialState: .init(), reducer: {GanaFeature()}))
}
