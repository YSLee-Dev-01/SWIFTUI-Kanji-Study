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
        VStack(spacing: 20) {
            StandardNavigationScrollView(title: "JLPT \(self.store.selectedJLPTLevel)", backBtnConfigAction: {
                self.store.send(.backBtnTapped)
            }) {
                
                LazyVStack(spacing: 20) {
                    ForEach(Array(self.store.kanjiList.enumerated()), id: \.offset) { row, data in
                        MainStyleView {
                            Button {
                                
                            } label: {
                                ExpandedView(alignment: .center) {
                                    Text(data.kanji)
                                        .foregroundStyle(Color.black)
                                        .font(.system(size: 30, weight: .medium))
                                        .padding(30)
                                }
                                .overlay {
                                    VStack {
                                        ExpandedView(alignment: .leading) {
                                            Text("\(row + 1)번째")
                                                .foregroundStyle(Color.black.opacity(0.4))
                                                .font(.system(size: 15, weight: .light))
                                        }
                                        
                                        Spacer()
                                        
                                        HStack {
                                            Image(systemName: "star")
                                                .resizable()
                                                .frame(width: 17, height: 17)
                                                .foregroundStyle(Color.black.opacity(0.4))
                                            
                                            Spacer()
                                            
                                            Image(systemName: "chevron.down")
                                                .resizable()
                                                .frame(width: 15, height: 8)
                                                .foregroundStyle(Color.black.opacity(0.4))
                                        }
                                    }
                                }
                                .padding(20)
                            }
                        }
                    }
                }
                .padding(.vertical, 20)
            }
        }
    }
}

#Preview {
    KanjiDetailView(store: .init(initialState: .init(kanjiList: [KanjiInfo(id: 1, kanji: "漢字", strokes: nil, jlptLevel: .N5, description: "설명설명")], selectedJLPTLevel: "N5"), reducer: {KanjiDetailFeature()}))
}
