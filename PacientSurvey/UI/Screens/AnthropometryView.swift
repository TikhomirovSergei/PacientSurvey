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
            PickerView(currentIndex: $appState.state.current.anthropometry.heightIndex,
                        text: "Рост, см",
                        array: heightArray)
            PickerView(currentIndex: $appState.state.current.anthropometry.growthInYouth,
                        text: "Рост в молодости, см",
                        array: heightArray)
            PickerView(currentIndex: $appState.state.current.anthropometry.weightIndex,
                        text: "Вес, кг",
                        array: weightArray)

            HStack {
                Text("ИМТ, кг/м2")
                Spacer()
                Text(self.calculateBMI())
            }

            PickerView(currentIndex: $appState.state.current.anthropometry.waistCircumference,
                        text: "Окружность талии, см",
                        array: waistCircumferenceArray)
            PickerView(currentIndex: $appState.state.current.anthropometry.shinVolume,
                        text: "Объем голени, см",
                        array: volumeArray)
            PickerView(currentIndex: $appState.state.current.anthropometry.shoulderVolume,
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

    private func calculateBMI() -> String {
        guard appState.state.current.anthropometry.heightIndex > 0,
                appState.state.current.anthropometry.weightIndex > 0 else {
            return ""
        }
        
        let height = (Float(heightArray[appState.state.current.anthropometry.heightIndex]) ?? 1) * 0.01
        let weight = Float(weightArray[appState.state.current.anthropometry.weightIndex]) ?? 0
        let bmi = weight / height
        
        guard bmi > 0.0 else { return "" }
            
        appState.state.current.anthropometry.BMI = String(bmi)
        return String(bmi)
    }
}
