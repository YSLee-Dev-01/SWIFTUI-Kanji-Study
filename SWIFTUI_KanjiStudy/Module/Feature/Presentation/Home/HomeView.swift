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
        VStack(spacing: 30) {
            LargeNavigationBar(title: "홈", backBtnConfig: nil)
            
            ExpandedView(alignment: .leading) {
                Text("최근 본 단어")
                    .font(.system(size: 20, weight: .semibold))
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                Text("최근 본 단어가 없어요.")
                    .font(.system(size: 18, weight: .semibold))
            }
            
            VStack(spacing: 20) {
                HStack(spacing: 10) {
                    self.createMainButton(
                        title: "あいう",
                        subTitle: "히라가나"
                    ){
                        self.store.send(.ganaBtnTapped(kanaType: .hiragana))
                    }
                    
                    self.createMainButton(
                        title: "アイウ",
                        subTitle: "가타카나"
                    ){
                        self.store.send(.ganaBtnTapped(kanaType: .katakana))
                    }
                }
               
                self.createMainButton(
                    title: "漢字単語",
                    subTitle: "한자"
                ){
                    
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 20)
    }
}

#Preview {
    HomeView(store: .init(initialState: .init(), reducer: {HomeFeature()}))
}

private extension HomeView {
    func createMainButton(title: String, subTitle: String, tappedAction: @escaping () -> ()) -> some View {
        MainStyleView {
            Button {
                tappedAction()
            } label: {
                ExpandedView(alignment: .center) {
                    Text(title)
                        .font(.system(size: 50, weight: .ultraLight))
                        .foregroundStyle(Color.gray.opacity(0.15))
                }
                .overlay {
                    Text(subTitle)
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundStyle(Color.black.opacity(0.9))
                }
            }
            .frame(height: 100)
        }
    }
}
