//
//  BartelIndexView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct BartelIndexView: View {
    
    @EnvironmentObject var appState: AppState
    
    @State private var message = ""
    @State private var showingAlert = false

    init() {
        UITableView.appearance().contentInset.top = 0
    }
    
    var body: some View {
        Form {
            BartelIndexTestItemView(title: "Прием пищи",
                                    answerlist: eatingTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.eatingTypesSelectedIndex)
            BartelIndexTestItemView(title: "Личная гигиена (умывание, чистка зубов, бритье)",
                                    answerlist: hygieneTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.hygieneSelectedIndex)
            BartelIndexTestItemView(title: "Одевание",
                                    answerlist: dressingTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.dressingSelectedIndex)
            BartelIndexTestItemView(title: "Прием ванны",
                                    answerlist: takingBathTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.takingBathSelectedIndex)
            BartelIndexTestItemView(title: "Контроль мочеиспускания",
                                    answerlist: urinationControlTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.urinationControlSelectedIndex)
            BartelIndexTestItemView(title: "Контроль дефекации",
                                    answerlist: bowelControlTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.bowelControlSelectedIndex)
            BartelIndexTestItemView(title: "Посещение туалета",
                                    answerlist: goingToToiletTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.goingToToiletSelectedIndex)
            BartelIndexTestItemView(title: "Вставание с постели",
                                    answerlist: gettingOutOfBedTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.gettingOutOfBedSelectedIndex)
            BartelIndexTestItemView(title: "Передвижение (кровать, стул)",
                                    answerlist: movementTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.movementSelectedIndex)
            BartelIndexTestItemView(title: "Подъем по лестнице",
                                    answerlist: climbingTheStairsTypes,
                                    selectedIndex: $appState.state.current.bartelIndexTest.climbingTheStairsSelectedIndex)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(message))
        }
        .padding(.horizontal, -15)
        .navigationBarTitle("Индекс Бартел", displayMode: .inline)
        .navigationBarItems(
            trailing:
                HeaderNextButtonView(imageName: "checkmark.circle", action: {
                    if self.validateFields() {
                        appState.state.current.bartelIndexTest.isSaved = true
                        appState.state.all.append(appState.state.current)
                        appState.isHiddenRootView = false
                    }
                })
        )
    }
    
    private func validateFields() -> Bool {
        guard appState.state.current.bartelIndexTest.eatingTypesSelectedIndex > -1 else {
            message = "Пункт \"Прием пищи\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.hygieneSelectedIndex > -1 else {
            message = "Пункт \"Личная гигиена (умывание, чистка зубов, бритье)\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.dressingSelectedIndex > -1 else {
            message = "Пункт \"Одевание\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.takingBathSelectedIndex > -1 else {
            message = "Пункт \"Прием ванны\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.urinationControlSelectedIndex > -1 else {
            message = "Пункт \"Контроль мочеиспускания\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.bowelControlSelectedIndex > -1 else {
            message = "Пункт \"Контроль дефекации\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.goingToToiletSelectedIndex > -1 else {
            message = "Пункт \"Посещение туалета\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.gettingOutOfBedSelectedIndex > -1 else {
            message = "Пункт \"Вставание с постели\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.movementSelectedIndex > -1 else {
            message = "Пункт \"Передвижение (кровать, стул)\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.bartelIndexTest.climbingTheStairsSelectedIndex > -1 else {
            message = "Пункт \"Подъем по лестнице\" не заполнен"
            showingAlert.toggle()
            return false
        }
        
        return true
    }
}
