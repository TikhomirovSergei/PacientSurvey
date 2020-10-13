//
//  BartelIndexTestItemView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 13.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct BartelIndexTestItemView: View {
    
    var title: String
    var answerlist: [AnswerBartelIndexTestModel]

    @Binding var selectedIndex: Int

    var body: some View {
        if #available(iOS 14.0, *) {
            Section(header: Text(title)) {
                ForEach(answerlist.indices, id: \.self) { index in
                    HStack {
                        Text(answerlist[index].title)
                            .font(.system(size: 14))
                        Spacer()
                        Image(systemName: "checkmark")
                            .opacity(selectedIndex == index ? 1 : 0)
                            .imageScale(.large)
                            .frame(width: 44, height: 44, alignment: .trailing)
                    }
                    .onTapGesture {
                        self.selectedIndex = index
                    }
                }
            }.textCase(.none)
        }
    }
}
