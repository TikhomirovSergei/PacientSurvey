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
    @State private var message = ""
    @State private var showingAlert = false
    
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
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(message))
        }
        .padding(.horizontal, -15)
        .navigationBarTitle(willMoveToFunctionalTestViewScreen ? Text("") : Text("Антропометрия"))
        .navigationBarItems(
            trailing:
                HeaderNextButtonView(imageName: "chevron.right", action: {
                    if self.validateFields() {
                        appState.state.current.anthropometry.isSaved = true
                        self.willMoveToFunctionalTestViewScreen = true
                    }
                })
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
    
    private func validateFields() -> Bool {
        guard appState.state.current.anthropometry.heightIndex > -1 else {
            message = "Рост пациента не введен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.anthropometry.growthInYouth > -1 else {
            message = "Рост в молодости пациента не введен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.anthropometry.weightIndex > -1 else {
            message = "Вес пациента не введен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.anthropometry.waistCircumference > -1 else {
            message = "Окружность талии пациента не введена"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.anthropometry.shinVolume > -1 else {
            message = "Объем голени пациента не введена"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.anthropometry.shoulderVolume > -1 else {
            message = "Объем плеча пациента не введена"
            showingAlert.toggle()
            return false
        }
        
        return true
    }
}
