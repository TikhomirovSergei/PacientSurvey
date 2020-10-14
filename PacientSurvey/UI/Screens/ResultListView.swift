//
//  ResultListView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 14.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct ResultListView: View {

    @EnvironmentObject var appState: AppState

    var body: some View {
        Form {
            ForEach(appState.state.all) { section in
                Text(section.pacient.username)
            }
        }
        .padding(.horizontal, -15)
        .navigationBarTitle(Text("Список осмотров"))
    }
}
