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
    var action: () -> Void

    var body: some View {
        Button(action: action, label: {
            text
                .font(.system(size: 18))
                .fontWeight(.bold)
        })
            .padding()
            .frame(width: 300, height: 50)
            .accentColor(Color.init(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)))
            .background(Color.init(#colorLiteral(red: 0.3671402931, green: 0.4564976096, blue: 0.9255109429, alpha: 1)))
            .cornerRadius(25)
    }
}
