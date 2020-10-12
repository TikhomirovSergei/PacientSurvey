//
//  BalanceTestView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 10.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct AnthropometryView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var willMoveToFunctionalTestViewScreen = false
    
    init() {
        UITableView.appearance().contentInset.top = -35
    }

    var body: some View {
        Form {
            PickerView(currentIndex: $appState.userData.anthropometry.heightIndex,
                        text: "Рост, см",
                        array: heightArray)
            PickerView(currentIndex: $appState.userData.anthropometry.growthInYouth,
                        text: "Рост в молодости, см",
                        array: heightArray)
            PickerView(currentIndex: $appState.userData.anthropometry.weightIndex,
                        text: "Вес, кг",
                        array: weightArray)
            PickerView(currentIndex: $appState.userData.anthropometry.BMI,
                        text: "ИМТ, кг/м2",
                        array: BMIArray )
            PickerView(currentIndex: $appState.userData.anthropometry.waistCircumference,
                        text: "Окружность талии, см",
                        array: waistCircumferenceArray)
            PickerView(currentIndex: $appState.userData.anthropometry.shinVolume,
                        text: "Объем голени, см",
                        array: volumeArray)
            PickerView(currentIndex: $appState.userData.anthropometry.shoulderVolume,
                        text: "Объем плеча, см",
                        array: volumeArray)
        }
        .padding(.horizontal, -15)
        .navigationBarTitle(Text("Антропометрия"), displayMode: .inline)
        .navigationBarItems(
            trailing: HeaderNextButtonView(willMoveToNextScreen: $willMoveToFunctionalTestViewScreen)
        )
        NavigationLink(destination: FunctionalTestView(),
                       isActive: $willMoveToFunctionalTestViewScreen) { }
    }
}
