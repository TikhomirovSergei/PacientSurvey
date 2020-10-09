//
//  ShackCell.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 08.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct ProblemModalCell: View {

    @Binding var problem: ProblemModal

    var body: some View {
        HStack {
            Image(systemName: (self.problem.isSelected ? "checkmark.square" : "square"))
            Text(self.problem.title)
        }
            .padding(.leading, 10)
            .onTapGesture {
                self.problem.isSelected.toggle()
        }
    }
}
