//
//  GanaView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/18/25.
//

import SwiftUI
import ComposableArchitecture

struct GanaView: View {
    @State private var store: StoreOf<GanaFeature>
    
    init(store: StoreOf<GanaFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack(spacing: 20) {
            LargeNavigationBar(title: self.store.isHiragana ? "히라가나" : "가타카나"){
                self.store.send(.backBtnTapped)
            }
        
            MainStyleView(cornerRadius: 0) {
                ExpandedView(alignment: .center) {
                    HStack(spacing: 10) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .foregroundStyle(Color.black.opacity(0.6))
                        
                        Text("가나를 눌러서 상세정보를 확인해보세요.")
                            .foregroundStyle(Color.black.opacity(0.6))
                            .font(.system(size: 16, weight: .medium))
                    }
                }
                .frame(height: 40)
            }
            
            VStack(spacing: 15) {
                ForEach(Array(self.store.gana.enumerated()), id: \.offset) { _, row in
                    HStack(spacing: 15) {
                        ForEach(Array(row.enumerated()), id: \.offset) { _, item in
                            if !item.isEmpty {
                                Button {
                                    
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
    GanaView(store: .init(initialState: .init(isHiragana: true), reducer: {GanaFeature()}))
}
