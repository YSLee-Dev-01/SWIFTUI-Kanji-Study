//
//  AppView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

struct AppView: View {
    @State private  var store: StoreOf<AppFeature>
    
    init(store: StoreOf<AppFeature>) {
        self.store = store
    }
    
    var body: some View {
        HomeView(store: self.store.scope(state: \.homeFeature, action: \.homeAction))
    }
}

#Preview {
    AppView(store: .init(initialState: .init(homeFeature: .init()), reducer: {AppFeature()}))
}
