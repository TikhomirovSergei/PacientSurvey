//
//  ContentView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 13.08.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @Environment(\.locale) private var locale: Locale
    @EnvironmentObject var appState: AppState

    @State private var willMoveToResultListViewScreen = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    self.headerView(geometry)
                    self.bodyView(geometry)
                    self.footerView(geometry)
                }
                
                NavigationLink(destination:
                                VStack {
                                    if appState.state.current.bartelIndexTest.isSaved {
                                        PacientView()
                                    } else if appState.state.current.screeningTest.isSaved {
                                        BartelIndexView()
                                    } else if appState.state.current.functionalTest.isSaved {
                                        ScreeningTestView()
                                    } else if appState.state.current.anthropometry.isSaved {
                                        FunctionalTestView()
                                    } else if appState.state.current.pacient.isSaved {
                                        AnthropometryView()
                                    } else {
                                        PacientView()
                                    }
                                },
                                isActive: $appState.isHiddenRootView) { }
                NavigationLink(destination: ResultListView(),
                                isActive: $willMoveToResultListViewScreen) { }
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
    
    private func headerView(_ geometry: GeometryProxy) -> some View {
        HStack(spacing: 20) {
            Button(action: {
                print("test")
            }, label: {
                Image(systemName: "gearshape")
                    .frame(width: 60, height: 60).imageScale(.large)
            })
                .frame(width: 60, height: 60)
        }
            .offset(x: geometry.size.width - 80, y: 10)
            .padding().frame(height: 44)
    }
    
    private func bodyView(_ geometry: GeometryProxy) -> some View {
        HStack {
            VStack {
                Image("Doctor")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .padding(.top, -50)
                
                Text("Welcome to the program for")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Comprehensive Geriatric Assessment")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .frame(width: geometry.size.width)
                    .multilineTextAlignment(.center)
                
                ButtonView(text: Text("Start inspection"),
                           accentColor: Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                           background: Color.init(#colorLiteral(red: 0.3671402931, green: 0.4564976096, blue: 0.9255109429, alpha: 1))) {
                    appState.isHiddenRootView.toggle()
                    appState.state.current.clear()
                }

                if appState.state.current.pacient.isSaved && !appState.state.current.bartelIndexTest.isSaved {
                    ButtonView(text: Text("Continue inspection"),
                               accentColor: Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)),
                               background: Color.init(#colorLiteral(red: 0.3671402931, green: 0.4564976096, blue: 0.9255109429, alpha: 1))) {
                        appState.isHiddenRootView.toggle()
                    }
                }
            }
        }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .padding(.bottom, 50)
    }

    private func footerView(_ geometry: GeometryProxy) -> some View {
        HStack {
            Spacer()
            ButtonView(text: Text("Show inspection list"),
                       accentColor: Color.init(#colorLiteral(red: 0.3671402931, green: 0.4564976096, blue: 0.9255109429, alpha: 1)),
                       background: Color.init(#colorLiteral(red: 0.9497030377, green: 0.9456732869, blue: 0.9528283477, alpha: 1))) {
                willMoveToResultListViewScreen.toggle()
            }
            Spacer()
        }
            .offset(x: 0, y: geometry.size.height - 75)
            .padding().frame(height: 50)
    }
}
