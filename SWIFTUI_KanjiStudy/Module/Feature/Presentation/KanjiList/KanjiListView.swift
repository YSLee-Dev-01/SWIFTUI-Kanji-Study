//
//  KanjiListView.swift
//  SWIFTUI_KanjiStudy
//
//  Created by 이윤수 on 8/21/25.
//

import SwiftUI
import ComposableArchitecture

struct KanjiListView: View {
    @State private var store: StoreOf<KanjiListFeature>
    
    init(store: StoreOf<KanjiListFeature>) {
        self.store = store
    }
    
    var body: some View {
        VStack(spacing: 20) {
            LargeNavigationBar(title: "한자"){
                self.store.send(.backBtnTapped)
            }
            
            MainStyleView(cornerRadius: 0) {
                ExpandedView(alignment: .center) {
                    HStack(spacing: 5) {
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 14, height: 14)
                            .foregroundStyle(Color.black.opacity(0.6))
                        
                        Text("JLPT 레벨에 맞춰서 한자를 확인하세요.")
                            .foregroundStyle(Color.black.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                    }
                    .frame(height: 40)
                }
            }
            
            VStack(spacing: 25) {
                ForEach(Array(self.store.steps.enumerated()), id: \.offset) { row, step in
                    Button {
                        
                    } label: {
                        ExpandedView(alignment: .leading) {
                            Text(step.title)
                                .font(.system(size: 35, weight: .semibold))
                                .foregroundStyle(Color.black)
                        }
                        .frame(maxHeight: .infinity)
                        .background {
                            ExpandedView(alignment: .trailing) {
                                Text("\(step.count)개")
                                    .font(.system(size: 35, weight: .light))
                                    .foregroundStyle(Color.black.opacity(0.15))
                            }
                        }
                        .padding(.horizontal, 20)
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.gray.opacity(Double(row + 1) * 0.1))
                        }
                    }
                }
            }
            .padding(.horizontal, 20)
        }
        .padding(.vertical, 20)
        .onAppear {
            self.store.send(.onAppear)
        }
    }
}

#Preview {
    KanjiListView(store: .init(initialState: .init(), reducer: {KanjiListFeature()}))
}
