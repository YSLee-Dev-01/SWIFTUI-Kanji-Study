//
//  KanjiListView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import SwiftUI
import ComposableArchitecture

struct KanjiListView: View {
    @State private var store: StoreOf<KanjiListFeature>
    
    init(store: StoreOf<KanjiListFeature>) {
        self.store = store
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}

#Preview {
    KanjiListView(store: .init(initialState: .init(), reducer: {KanjiListFeature()}))
}
