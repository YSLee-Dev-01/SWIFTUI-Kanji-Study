//
//  KanaView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

struct KanaView: View {
    @State private var store: StoreOf<KanaFeature>
    
    init(store: StoreOf<KanaFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack(spacing: 20) {
            LargeNavigationBar(title: self.store.kanaType == .hiragana ? "히라가나" : "가타카나"){
                self.store.send(.backBtnTapped)
            }
        
            MainStyleView(cornerRadius: 0) {
                ExpandedView(alignment: .center) {
                    HStack(spacing: 10) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 16, height: 16)
                            .foregroundStyle(Color.black.opacity(0.6))
                        
                        Text("가나를 눌러서 상세정보를 확인해보세요.")
                            .foregroundStyle(Color.black.opacity(0.6))
                            .font(.system(size: 15, weight: .medium))
                    }
                }
                .frame(height: 40)
            }
            
            VStack(spacing: 15) {
                ForEach(Array(self.store.kanaList.enumerated()), id: \.offset) { row, rowItem in
                    HStack(spacing: 15) {
                        ForEach(Array(rowItem.enumerated()), id: \.offset) { itemIndex, item in
                            if !item.isEmpty {
                                Button {
                                    self.store.send(.ganaSelected(IndexPath(row: itemIndex, section: row)))
                                } label : {
                                    MainStyleView {
                                        ExpandedView(alignment: .center) {
                                            Text(item)
                                                .font(.system(size: 17, weight: .light))
                                                .foregroundStyle(Color.black)
                                                .frame(maxHeight: 55)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
            .frame(maxHeight: .infinity)
            
        }
        .padding(.vertical, 20)
        .onAppear {
            self.store.send(.onAppear)
        }
    }
}

#Preview {
    KanaView(store: .init(initialState: .init(kanaType: .hiragana), reducer: {KanaFeature()}))
}
