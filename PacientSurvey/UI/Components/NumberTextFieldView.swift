//
//  IntTextFieldView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 10.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct NumberTextFieldView: View {
    
    var placeholder: String
    var isPhoneNumber: Bool
    
    @Binding var field: String
    
    var body: some View {
        FloatingLabelTextField($field, placeholder: placeholder, editingChanged: { (_) in }) { }
            .isShowError(true)
            .addValidations([
                isPhoneNumber
                    ? .init(condition: field.isValid(.mobileNumber), errorMessage: "Не корректный номер телефона")
                    : .init(condition: field.isAgeValid(0, 150), errorMessage: "Следует ввести число в диапазоне (0, 150)")
                ])
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 70)
            .textContentType(.oneTimeCode)
            .keyboardType(.numberPad)
            .modifier(ThemeTextField())
            .padding(.horizontal, 10)
            .padding(.vertical, -15)
    }
}

// MARK: - ViewModifier

struct ThemeTextField: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(height: 60)
    }
}
