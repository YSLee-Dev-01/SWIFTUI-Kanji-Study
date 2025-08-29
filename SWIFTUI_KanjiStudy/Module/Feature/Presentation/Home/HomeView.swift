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
        VStack(spacing: 20) {
            LargeNavigationBar(title: "홈", backBtnConfig: nil)
            
            MainStyleView {
                Button {
                    self.store.send(.searchBtnTapped)
                } label: {
                    ExpandedView(alignment: .leading) {
                        HStack(spacing: 10) {
                            Image(systemName: "magnifyingglass")
                                .resizable()
                                .frame(width: 17, height: 17)
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.leading, 15)
                            
                            Text("검색")
                                .font(.system(size: 15, weight: .medium))
                                .foregroundColor(.black.opacity(0.7))
                                .padding(.vertical, 15)
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            VStack(spacing: 20) {
                HStack {
                    Text("즐겨찾기 한 단어")
                        .font(.system(size: 17, weight: .semibold))
                    
                    Spacer()
                    
                    if !self.store.favoriteWords.isEmpty {
                        Button {
                            self.store.send(.editBtnTapped)
                        } label: {
                            Text(self.store.isEditMode ? "완료" : "삭제")
                                .font(.system(size: 15, weight: .light))
                                .foregroundColor(.black)
                                .padding(.horizontal, 10)
                        }
                    }
                }
                if self.store.favoriteWords.isEmpty {
                    ExpandedView(alignment: .center) {
                        Text("외우고 싶은 단어를 저장해보세요.")
                            .font(.system(size: 15, weight: .medium))
                            .padding(.top, 10)
                    }
                } else {
                    ScrollView(.horizontal) {
                        Group {
                            LazyHStack(spacing: 20) {
                                ForEach(Array(self.store.favoriteWords.enumerated()), id: \.offset) { row, data in
                                    MainStyleView {
                                        Text(data)
                                            .font(.system(size: 25, weight: .medium))
                                            .foregroundColor(.black)
                                            .frame(width: 75, height: 75)
                                    }
                                    .overlay {
                                        if self.store.isEditMode {
                                            ExpandedView(alignment: .trailing) {
                                                VStack {
                                                    Image(systemName: "xmark")
                                                        .resizable()
                                                        .frame(width: 10, height: 10)
                                                        .foregroundColor(.black)
                                                    
                                                    Spacer()
                                                }
                                                .padding(7)
                                            }
                                        }
                                    }
                                    .onTapGesture {
                                        self.store.send(.favoriteWordTapped(row))
                                    }
                                    .transition(.offset(x: -25, y : 0).combined(with: .opacity))
                                }
                            }
                        }
                        .animation(.smooth(duration: 0.2), value: self.store.isEditMode)
                        .animation(.smooth(duration: 0.2), value: self.store.favoriteWords)
                    }
                    .scrollIndicators(.hidden)
                    .frame(height: 75)
                }
            }
            .padding(.horizontal, 20)
            
            Spacer()
            
            VStack(spacing: 20) {
                HStack(spacing: 20) {
                    self.createMainButton(
                        title: "あいう",
                        subTitle: "히라가나"
                    ){
                        self.store.send(.kanaBtnTapped(kanaType: .hiragana))
                    }
                    
                    self.createMainButton(
                        title: "アイウ",
                        subTitle: "가타카나"
                    ){
                        self.store.send(.kanaBtnTapped(kanaType: .katakana))
                    }
                }
               
                self.createMainButton(
                    title: "漢字単語",
                    subTitle: "한자"
                ){
                    self.store.send(.kanjiBtnTapped)
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
