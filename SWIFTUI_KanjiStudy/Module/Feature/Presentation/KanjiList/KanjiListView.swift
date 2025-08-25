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
            LargeNavigationBar(title: self.store.selectedStepRow == nil ? "한자" : "상세보기"){
                if self.store.selectedStep == nil {
                    self.store.send(.backBtnTapped)
                } else {
                    self.store.send(.stepDeselected)
                }
            }
            
            if let selectedStepRow = self.store.selectedStepRow {
                ExpandedView(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("JLPT")
                            .foregroundStyle(Color.black.opacity(0.6))
                            .font(.system(size: 14, weight: .medium))
                        
                        Text("\((self.store.selectedStep?.jlptLevel.rawValue) ?? "")")
                            .font(.system(size: 22, weight: .semibold))
                        
                        Spacer()
                        
                        Text("\((self.store.selectedStep?.count) ?? 0)개")
                            .font(.system(size: 14, weight: .medium))
                    }
                    .padding(.horizontal, 20)
                }
                .frame(height: 60)
                .background {
                   Rectangle()
                        .fill(Color.gray.opacity(Double(selectedStepRow + 1) * 0.1))
                }
                .transition(.offset(x: 0, y : 25).combined(with: .opacity))
            } else {
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
                .transition(.offset(x: 0, y : -25).combined(with: .opacity))
            }
            
            if let _ = self.store.selectedStep {
                ScrollView {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 20), GridItem(.flexible(), spacing: 20)], spacing: 20) {
                        ForEach(0 ..< self.store.selectedStepKanjiCount, id: \.self) { row in
                            MainStyleView {
                                Button {
                                    self.store.send(.subStepTapped(row))
                                } label: {
                                    ExpandedView(alignment: .center) {
                                        Text("\(row + 1)")
                                            .foregroundStyle(Color.black)
                                            .font(.system(size: 22, weight: .semibold))
                                            .frame(height: 65)
                                    }
                                    .overlay {
                                        Text("STEP")
                                            .font(.system(size: 50, weight: .ultraLight))
                                            .foregroundStyle(Color.gray.opacity(0.2))
                                    }
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                }
                .transition(.offset(x: 0, y : 100).combined(with: .opacity))
                
            } else {
                VStack(spacing: 20) {
                    ForEach(Array(self.store.steps.enumerated()), id: \.offset) { row, step in
                        Button {
                            self.store.send(.stepBtnTapped(row))
                        } label: {
                            ExpandedView(alignment: .leading) {
                                Text(step.jlptLevel.rawValue)
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
                .transition(.offset(x: 0, y : -100).combined(with: .opacity))
            }
        }
        .overlay {
            if self.store.selectedStep != nil {
                ExpandedView(alignment: .leading) {
                    Rectangle()
                        .fill(Color.clear)
                        .contentShape(Rectangle())
                        .frame(width: 15)
                        .frame(maxHeight: .infinity)
                        .gesture(
                            DragGesture()
                                .onChanged { _ in
                                    self.store.send(.stepDeselected)
                                }
                        )
                }
            }
        }
        .padding(.vertical, 20)
        .animation(.spring(duration: 0.2), value: self.store.selectedStep)
        .onAppear {
            self.store.send(.onAppear)
        }
    }
}

#Preview {
    KanjiListView(store: .init(initialState: .init(), reducer: {KanjiListFeature()}))
}
