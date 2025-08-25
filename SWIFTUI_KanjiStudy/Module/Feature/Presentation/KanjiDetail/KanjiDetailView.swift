//
//  KanjiDetailView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/25/25.
//

import SwiftUI
import ComposableArchitecture

struct KanjiDetailView: View {
    @State private var store: StoreOf<KanjiDetailFeature>
    
    init(store: StoreOf<KanjiDetailFeature>) {
        self.store = store
    }
    
    var body: some View {
        Text("KanjiDetailView")
    }
}

#Preview {
    KanjiDetailView(store: .init(initialState: .init(), reducer: {KanjiDetailFeature()}))
}
