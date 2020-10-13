//
//  FunctionalTestView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct FunctionalTestView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var willMoveToScreeningTestViewScreen = false
    @State private var message = ""
    @State private var showingAlert = false
    
    init() {
        UITableView.appearance().contentInset.top = -35
    }

    var body: some View {
        Form {
            PickerView(currentIndex: $appState.state.current.functionalTest.walkingSpeed,
                        text: "Скорость ходьбы, м/с",
                        array: speedArray)
            PickerView(currentIndex: $appState.state.current.functionalTest.testGetUpAndGo,
                        text: "Тест \"Встань и иди\", сек",
                        array: testGetUpAndGoArray)
            PickerView(currentIndex: $appState.state.current.functionalTest.positionFeetTogether,
                        text: "Положение \"Стопы вместе\", сек",
                        array: semiTandemPositionArray)
            PickerView(currentIndex: $appState.state.current.functionalTest.semiTandemPosition,
                        text: "Полутандемное положение, сек",
                        array: semiTandemPositionArray)
            PickerView(currentIndex: $appState.state.current.functionalTest.tandemPosition,
                        text: "Тандемное положение, сек",
                        array: tandemPositionArray)
            PickerView(currentIndex: $appState.state.current.functionalTest.standUpIndex,
                        text: "Время 5-ти подъемов со стула, сек",
                        array: standUpArray)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(message))
        }
        .padding(.horizontal, -15)
        .navigationBarTitle(Text("Функциональный тест"), displayMode: .inline)
        .navigationBarItems(
            trailing:
                HeaderNextButtonView(action: {
                    if self.validateFields() {
                        appState.state.current.functionalTest.isSaved = true
                        self.willMoveToScreeningTestViewScreen.toggle()
                    }
                })
        )
        NavigationLink(destination: ScreeningTestView(),
                       isActive: $willMoveToScreeningTestViewScreen) { }
    }
    
    private func validateFields() -> Bool {
        guard appState.state.current.functionalTest.walkingSpeed > -1 else {
            message = "Скорость ходьбы пациента не введена"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.functionalTest.testGetUpAndGo > -1 else {
            message = "Результат теста \"Встань и иди\" не введен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.functionalTest.positionFeetTogether > -1 else {
            message = "Поле \'Положение \"Стопы вместе\"\' не заполнено"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.functionalTest.semiTandemPosition > -1 else {
            message = "Поле \'Полутандемное положение\' не заполнено"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.functionalTest.tandemPosition > -1 else {
            message = "Поле \', положение\' не заполнено"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.functionalTest.standUpIndex > -1 else {
            message = "Время 5-ти подъемов со стула пациента не введена"
            showingAlert.toggle()
            return false
        }
        
        return true
    }
}
