//
//  NextButtonView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct HeaderNextButtonView: View {

    var imageName: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            Image(systemName: imageName).imageScale(.large)
        }
        .frame(width: 44, height: 44, alignment: .trailing)
        .padding(.leading, -10)
    }
}
