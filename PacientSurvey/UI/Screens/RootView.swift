//
//  ContentView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 13.08.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct RootView: View {

    @State var isNavigationBarHidden: Bool = true

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                GeometryReader { geometry in
                    self.headerView(geometry)
                    self.bodyView(geometry)
                    self.footerView(geometry)
                }
            }
                .navigationBarTitle("")
                .navigationBarHidden(self.isNavigationBarHidden)
                .onAppear { self.isNavigationBarHidden = true }
        }
    }
}

// MARK: - Displaying buttons view

private extension RootView {
    func headerView(_ geometry: GeometryProxy) -> some View {
        HStack(spacing: 20) {
            Button(action: {
                print("test")
            }, label: {
                Image("SettingsIcon").resizable()
            })
                .frame(width: 44, height: 44)
        }
            .offset(x: geometry.size.width - 80, y: 10)
            .padding().frame(height: 44)
    }

    func bodyView(_ geometry: GeometryProxy) -> some View {
        HStack() {
            VStack {
                Text("Welcome to the program for")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .padding()
                Text("Comprehensive Geriatric Assessment")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .frame(width: geometry.size.width)
                    .multilineTextAlignment(.center)

                NavigationLink(destination: PacientView(isNavigationBarHidden: self.$isNavigationBarHidden), label: {
                    Text("Start inspection")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                })
                    .frame(width: 300, height: 50)
                    .accentColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .background(Color.init(#colorLiteral(red: 0.3671402931, green: 0.4564976096, blue: 0.9255109429, alpha: 1)))
                    .cornerRadius(25)
                    .padding()

                Button(action: {
                    print("test")
                }, label: {
                    Text("Continue inspection")
                        .font(.system(size: 18))
                        .fontWeight(.bold)
                })
                    .frame(width: 300, height: 50)
                    .accentColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
                    .background(Color.init(#colorLiteral(red: 0.3671402931, green: 0.4564976096, blue: 0.9255109429, alpha: 1)))
                    .cornerRadius(25)
            }
        }
            .frame(width: geometry.size.width, height: geometry.size.height - 50)
    }

    func footerView(_ geometry: GeometryProxy) -> some View {
        HStack() {
            Spacer()
            Button(action: {
                print("test")
            }, label: {
                Text("Show inspection list")
                    .font(.system(size: 18))
                    .fontWeight(.bold)
            })
                .padding()
                .frame(width: 300, height: 50)
                .accentColor(Color.init(#colorLiteral(red: 0.3671402931, green: 0.4564976096, blue: 0.9255109429, alpha: 1)))
                .background(Color.init(#colorLiteral(red: 0.9497030377, green: 0.9456732869, blue: 0.9528283477, alpha: 1)))
                .cornerRadius(25)
            Spacer()
        }
            .offset(x: 0, y: geometry.size.height - 75)
            .padding().frame(height: 50)
    }
}

#if DEBUG
    struct RootView_Previews: PreviewProvider {
        static var previews: some View {
            RootView()
        }
    }
#endif
