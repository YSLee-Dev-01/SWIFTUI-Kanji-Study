//
//  SearchView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/27/25.
//

import SwiftUI
import ComposableArchitecture

struct SearchView: View {
    @State private var store: StoreOf<SearchFeature>
    
    init(store: StoreOf<SearchFeature>) {
        self.store = store
    }
    
    var body: some View {
        Text("SearchView")
    }
}

#Preview {
    SearchView(store: .init(initialState: .init(), reducer: {SearchFeature()}))
}
