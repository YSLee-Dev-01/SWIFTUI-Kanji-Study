//
//  HomeView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

struct HomeView: View {
    @State private var store: StoreOf<HomeFeature>
    
    init(store: StoreOf<HomeFeature>) {
        self.store = store
    }
    
    var body: some View {
        StandardNavigationScrollView(title: "홈", backBtnConfig: nil) {
           Text("Home View")
        }
    }
}

#Preview {
    HomeView(store: .init(initialState: .init(), reducer: {HomeFeature()}))
}
