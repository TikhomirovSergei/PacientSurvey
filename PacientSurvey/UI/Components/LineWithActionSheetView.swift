//
//  LineWithActionSheetView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 09.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct LineWithActionSheetView: View {
    
    var title: String
    var arrayList: [String]
    
    @Binding var isShowActionsSheet: Bool
    @Binding var status: String
    
    var body: some View {
        GeometryReader { geometry in
            HStack() {
                Text(title)
                    .fontWeight(.bold)
                    .actionSheet(isPresented: $isShowActionsSheet) {
                        ActionSheet(title: Text(title), buttons: arrayList.map { item in
                            .default(Text(item)) { self.status = item }
                        })
                    }
                    .frame(width: geometry.size.width / 2, alignment: .leading)
                Text(self.status)
                    .frame(width: geometry.size.width / 2, alignment: .trailing)
            }
            .onTapGesture {
                self.isShowActionsSheet = true
            }
        }
        .padding(.trailing, 10)
        .padding(.leading, 15)
        .padding(.vertical, 10)
    }
}
