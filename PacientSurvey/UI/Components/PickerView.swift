//
//  PickerView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct PickerView: View {
    
    @Binding var currentIndex: Int
    
    var text: String
    var array: [String]
    
    var body: some View {
        Picker(selection: $currentIndex, label: Text(text)) {
            ForEach(0 ..< array.count) {
                Text(self.array[$0])
            }
        }
    }
}
