//
//  LineWithActionSheetView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 09.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

let statusArray: [String] = ["Женат/замужем", "Не женат/не замужем", "Вдовец/вдова", "В разводе"]
let resideArray: [String] = ["С женой/мужем", "Один", "С детьми", "Другое"]

struct LineWithActionSheetView: View {
    
    var title: String
    var arrayList: [String]
    
    @Binding var isShowActionsSheet: Bool
    @Binding var status: String
    
    var body: some View {
        VStack(alignment: .leading) {
            GeometryReader { geometry in
                HStack {
                    Text(title)
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
            .padding(.trailing, 25)
            .padding(.leading, 10)
            .padding(.vertical, 10)
            
            Divider()
                .frame(height: 1)
                .background(Color.black)
                .padding(.horizontal, 10)
        }
    }
}
