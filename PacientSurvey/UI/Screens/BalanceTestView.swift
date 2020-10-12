//
//  BalanceTestView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 10.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct BalanceTestView: View {
    
    @EnvironmentObject var appState: AppState

    var body: some View {
        Form {
            if #available(iOS 14.0, *) {
                Section(header: Text("Тесты для оценки мобильности")) {
                    PickerView(currentIndex: $appState.userData.balanceTest.heightIndex, text: "Рост, см", array: heightArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.growthInYouth, text: "Рост в молодости, см", array: heightArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.weightIndex, text: "Вес, кг", array: weightArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.BMI, text: "ИМТ, кг/м2", array: BMIArray )
                    PickerView(currentIndex: $appState.userData.balanceTest.waistCircumference, text: "Окружность талии, см", array: waistCircumferenceArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.shinVolume, text: "Объем голени, см", array: volumeArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.shoulderVolume, text: "Объем плеча, см", array: volumeArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.walkingSpeed, text: "Скорость ходьбы, м/с", array: speedArray)
                }.textCase(nil)
            }
            
            if #available(iOS 14.0, *) {
                Section(header: Text("Тест \"Встань и иди\" (сек)")) {
                    PickerView(currentIndex: $appState.userData.balanceTest.positionFeetTogether, text: "Положение \"Стопы вместе\"", array: semiTandemPositionArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.semiTandemPosition, text: "Полутандемное положение", array: semiTandemPositionArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.tandemPosition, text: "Тандемное положение", array: tandemPositionArray)
                    PickerView(currentIndex: $appState.userData.balanceTest.standUpIndex, text: "Время 5-ти подъемов со стула", array: standUpArray)
                }.textCase(nil)
            }
        }
        .padding(.vertical, -15)
        .padding(.horizontal, -15)
        .navigationBarTitle(Text("Оценка равновесия"), displayMode: .inline)
    }
}
