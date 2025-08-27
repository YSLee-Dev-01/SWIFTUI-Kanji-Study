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
    @FocusState private var focusField
    
    init(store: StoreOf<SearchFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack(spacing: 20) {
            LargeNavigationBar(title: "검색"){
                self.store.send(.backBtnTapped)
            }
            
            MainStyleView {
                ExpandedView(alignment: .leading) {
                    TextField(text: self.$store.insertedText.sending(\.textInserted)) {
                        Text("원하는 단어를 검색하세요.")
                    }
                    .focused(self.$focusField)
                }
                .font(.system(size: 15, weight: .medium))
                .foregroundColor(.black.opacity(0.7))
                .padding(15)
            }
            .padding(.horizontal, 20)
            
            ScrollView {
                if !self.store.insertedText.isEmpty && self.store.searchResult.isEmpty && !self.store.searchLoading {
                    Text("검색 결과가 없어요.")
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.black.opacity(0.7))
                    
                } else if self.store.searchLoading {
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding()
                    
                }  else {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                        ForEach(Array(self.store.searchResult.enumerated()), id: \.offset) { row, data in
                            MainStyleView {
                                Button {
                                    self.focusField = false
                                    self.store.send(.resultRowTapped(row))
                                } label: {
                                    ExpandedView(alignment: .center) {
                                        Text("\(data.kanji)")
                                            .foregroundStyle(Color.black)
                                            .font(.system(size: 22, weight: .medium))
                                            .frame(height: 75)
                                    }
                                    .overlay {
                                        VStack {
                                            Spacer()
                                            
                                            ExpandedView(alignment: .leading) {
                                                Image(systemName: data.isFavoriteWord ? "star.fill" : "star")
                                                    .resizable()
                                                    .frame(width: 17, height: 17)
                                                    .foregroundStyle(Color.black.opacity(0.4))
                                                    .onTapGesture {
                                                        self.store.send(.starBtnTapped(row))
                                                    }
                                            }
                                            
                                            Spacer()
                                                .frame(height: 15)
                                        }
                                        .padding(.leading, 15)
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
            }
        }
        .padding(.vertical, 20)
        .onAppear {
            if self.store.insertedText.isEmpty {
                self.focusField = true
            }
        }
    }
}

#Preview {
    SearchView(store: .init(initialState: .init(), reducer: {SearchFeature()}))
}
