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
                    if let selectedKanaInfo = self.store.selectedKanaInfo {
                        HStack(spacing: 25) {
                            Text(selectedKanaInfo.originalKana)
                                .font(.system(size: 50, weight: .semibold))
                                .frame(width: 70, height: 70)
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.gray.opacity(0.1))
                                }
                            
                            Image(systemName: "arrow.left.arrow.right")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundStyle(Color.gray.opacity(0.6))
                            
                            VStack(spacing: 10) {
                                Group {
                                    Text(selectedKanaInfo.koreanPronunciation)
                                    Text(selectedKanaInfo.englishPronunciation)
                                }
                                .font(.system(size: 30, weight: .semibold))
                                .padding(.horizontal, 10)
                                .frame(height: 50)
                                .background {
                                    RoundedRectangle(cornerRadius: 15)
                                        .fill(Color.gray.opacity(0.1))
                                }
                            }
                        }
                        .padding(20)
                    } else {
                        HStack(spacing: 10) {
                            Image(systemName: "info.circle")
                                .resizable()
                                .frame(width: 14, height: 14)
                                .foregroundStyle(Color.black.opacity(0.6))
                            
                            Text("가나를 눌러서 상세정보를 확인해보세요.")
                                .foregroundStyle(Color.black.opacity(0.6))
                                .font(.system(size: 14, weight: .medium))
                        }
                        .frame(height: 40)
                    }
                }
            }
            .onTapGesture {
                self.store.send(.kanaDeselected)
            }
            
            VStack(spacing: 15) {
                ForEach(Array(self.store.kanaList.enumerated()), id: \.offset) { row, rowItem in
                    HStack(spacing: 15) {
                        ForEach(Array(rowItem.enumerated()), id: \.offset) { itemIndex, item in
                            if !item.isEmpty {
                                Button {
                                    self.store.send(.kanaSelected(IndexPath(row: itemIndex, section: row)))
                                } label : {
                                    let isSelected = self.store.selectedKanaInfo?.originalKana == item
                                    
                                    Group {
                                        if isSelected {
                                            ExpandedView(alignment: .center) {
                                                Text(item)
                                                    .frame(maxHeight: 55)
                                            }
                                            .background {
                                                RoundedRectangle(cornerRadius: 15)
                                                    .fill(Color.black.opacity(0.7))
                                            }
                                        } else {
                                            MainStyleView {
                                                ExpandedView(alignment: .center) {
                                                    Text(item)
                                                        .frame(maxHeight: 55)
                                                }
                                            }
                                        }
                                    }
                                    .font(.system(size: 17, weight: isSelected ? .semibold : .light))
                                    .foregroundStyle(isSelected ? Color.white :  Color.black)
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
        .animation(.smooth(duration: 0.2), value: self.store.selectedKanaInfo)
        .onAppear {
            self.store.send(.onAppear)
        }
    }
}

#Preview {
    KanaView(store: .init(initialState: .init(kanaType: .hiragana), reducer: {KanaFeature()}))
}
