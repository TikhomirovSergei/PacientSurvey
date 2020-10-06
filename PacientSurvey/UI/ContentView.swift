//
//  ContentView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 13.08.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Карта сестринского наблюдения за пациентом")
                .fontWeight(.bold)
                .font(.title)
                .padding()
            Button(action: {
                print("Pressed")
            }) {
                Text("Начать осмотр")
                    .fontWeight(.bold)
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.purple, lineWidth: 5)
                    )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
