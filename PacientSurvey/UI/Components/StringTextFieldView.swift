//
//  StringTextFieldView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 10.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct StringTextFieldView: View {
    
    var placeholder: String
    
    @Binding var field: String
    
    var body: some View {
        FloatingLabelTextField($field, placeholder: placeholder, editingChanged: { (isChanged) in }) { }
            .isShowError(true)
            .addValidations([
                // .init(condition: field.isValid(.alphabetWithSpace), errorMessage: "В поле могут присутствовать только буквы и пробел"),
                .init(condition: field.count >= 2, errorMessage: "В поле должно быть не менее 2-х символов")
                ])
            .floatingStyle(ThemeTextFieldStyle())
            .autocapitalization(.words)
            .frame(height: 70)
            .padding(.horizontal, 10)
            .padding(.vertical, -5)
    }
}

// MARK: - Create floating style

struct ThemeTextFieldStyle: FloatingLabelTextFieldStyle {
    func body(content: FloatingLabelTextField) -> FloatingLabelTextField {
        content
            .selectedTextColor(.black)
            .selectedLineColor(.black)
            .selectedTitleColor(.black)
            .textColor(.black)
            .titleColor(.black)
            .lineColor(.black)
            .errorColor(.init(UIColor.red))
    }
}
