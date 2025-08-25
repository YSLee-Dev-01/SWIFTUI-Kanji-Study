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
        NavigationStack(path: self.$store.scope(state: \.path, action: \.path), root: {
            HomeView(store: self.store.scope(state: \.homeFeature, action: \.homeAction))
        }) { store in
            Group {
                switch store.state {
                case .kanaState:
                    if let store = store.scope(state: \.kanaState, action: \.kanaAction) {
                        KanaView(store: store)
                    }
                    
                case .kanjiListState:
                    if let store = store.scope(state: \.kanjiListState, action: \.kanjiListAction) {
                        KanjiListView(store: store)
                    }
                case .kanjiDetailState(_):
                    if let store = store.scope(state: \.kanjiDetailState, action: \.kanjiDetailAction) {
                        KanjiDetailView(store: store)
                    }
                }
            }
            .navigationBarBackButtonHidden()
        }
    }
}

#Preview {
    AppView(store: .init(initialState: .init(homeFeature: .init()), reducer: {AppFeature()}))
}
