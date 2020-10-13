//
//  ScreeningTestView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct ScreeningTestView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var willMoveToBartelIndexViewScreen = false
    
    init() {
        UITableView.appearance().contentInset.top = -35
    }

    var body: some View {
        Form {
            Toggle(isOn: $appState.state.current.screeningTest.isLostWeight) {
                Text("Похудели ли Вы на 5 и более кг за последние 6 месяцев?")
            }
            Toggle(isOn: $appState.state.current.screeningTest.isReducedVisionOrHearing) {
                Text("Испытываете ли Вы какие-то ограничения в повседневной жизни из-за снижения Зрения или Слуха?")
            }
            Toggle(isOn: $appState.state.current.screeningTest.isFallInjuries) {
                Text("Были ли у Вас в течение последнего года травмы, связанные с падением?")
            }
            Toggle(isOn: $appState.state.current.screeningTest.isDepressedMood) {
                Text("Чувствуете ли Вы себя подавленным, грустным или встревоженным на протяжении последний недель?")
            }
            Toggle(isOn: $appState.state.current.screeningTest.isMemoryProblems) {
                Text("Есть ли у Вас проблемы с Памятью, пониманием, ориентацией или способностью планировать?")
            }
            Toggle(isOn: $appState.state.current.screeningTest.isUrinaryIncontinence) {
                Text("Страдаете ли Вы недержанием Мочи?")
            }
            Toggle(isOn: $appState.state.current.screeningTest.isDifficultToMove) {
                Text("Испытываете ли Вы трудности в перемещении по дому или на улице?")
            }
        }
        .padding(.horizontal, -15)
        .navigationBarTitle(Text("Скрининг \"Возраст не помеха\""), displayMode: .inline)
        .navigationBarItems(
            trailing: HeaderNextButtonView(willMoveToNextScreen: $willMoveToBartelIndexViewScreen)
        )
        NavigationLink(destination: BartelIndexView(),
                       isActive: $willMoveToBartelIndexViewScreen) { }
    }
}
