//
//  ButtonView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 14.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct ButtonView: View {

    var text: Text
    var accentColor: Color
    var background: Color
    var action: () -> Void

    var body: some View {
        Button(action: action, label: {
            text
                .font(.system(size: 18))
                .fontWeight(.bold)
        })
            .padding()
            .frame(width: 300, height: 50)
            .accentColor(accentColor)
            .background(background)
            .cornerRadius(25)
    }
}
