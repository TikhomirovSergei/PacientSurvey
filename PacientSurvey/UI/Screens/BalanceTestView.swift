//
//  BalanceTestView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 10.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct BalanceTestView: View {

    var body: some View {
        ScrollView {
        }
            .gesture(
                TapGesture().onEnded { _ in
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
            )
            .navigationBarTitle(Text("Оценка равновесия"), displayMode: .inline)
            .navigationBarItems(trailing: Button("Next") {})
    }
}
