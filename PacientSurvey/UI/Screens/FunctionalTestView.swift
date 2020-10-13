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
        .padding(.horizontal, -15)
        .navigationBarTitle(Text("Функциональный тест"), displayMode: .inline)
        .navigationBarItems(
            trailing: HeaderNextButtonView(willMoveToNextScreen: $willMoveToScreeningTestViewScreen)
        )
        NavigationLink(destination: ScreeningTestView(),
                       isActive: $willMoveToScreeningTestViewScreen) { }
    }
}
