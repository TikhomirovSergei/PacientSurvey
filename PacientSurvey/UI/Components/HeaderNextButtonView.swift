//
//  NextButtonView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct HeaderNextButtonView: View {

    @Binding var willMoveToNextScreen: Bool

    var body: some View {
        Button(action: {
            self.willMoveToNextScreen.toggle()
        }) {
            Image(systemName: "chevron.right").imageScale(.large)
        }
        .frame(width: 44, height: 44, alignment: .trailing)
        .padding(.leading, -10)
    }
}
