//
//  LineWithDatePicker.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 10.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct LineWithDatePicker: View {
    
    var title: String
    
    @Binding var date: Date
    
    var body: some View {
        VStack(alignment: .leading) {
            DatePicker(title, selection: $date, in: ...Date(), displayedComponents: .date)
                .foregroundColor(.black)
                .padding(.top, 15)
                .padding(.leading, 12)
                .padding(.trailing, 12)
            
            Divider()
                .frame(height: 1)
                .background(Color.black)
                .padding(.horizontal, 10)
                .padding(.top, -7)
        }
    }
}
