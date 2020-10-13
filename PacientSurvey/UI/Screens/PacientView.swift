//
//  PacientView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 08.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI

struct PacientView: View {
    
    @EnvironmentObject var appState: AppState

    @State private var showingStatusActionSheet = false
    @State private var showingResideStatusActionSheet = false
    @State private var willMoveToBalanceTestViewScreen = false    
    @State private var message = ""
    @State private var showingAlert = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    StringTextFieldView(placeholder: "Ф.И.О. пациента", field: $appState.state.current.pacient.username)
                    NumberTextFieldView(placeholder: "Возраст", isPhoneNumber: false, field: $appState.state.current.pacient.age)
                    StringTextFieldView(placeholder: "Отделение", field: $appState.state.current.pacient.departament)
                    NumberTextFieldView(placeholder: "№ палаты", isPhoneNumber: false, field: $appState.state.current.pacient.room)
                    StringTextFieldView(placeholder: "Контактное лицо", field: $appState.state.current.pacient.contactPerson)
                    NumberTextFieldView(placeholder: "Номер телефона", isPhoneNumber: true, field: $appState.state.current.pacient.phoneNumber)
                    StringTextFieldView(placeholder: "Ф.И.О. лечащего врача", field: $appState.state.current.pacient.doctorName)
                }

                LineWithDatePicker(title: "Дата поступления", date: $appState.state.current.pacient.receiptDate)

                LineWithActionSheetView(
                    title: "Семейный статус",
                    arrayList: statusArray,
                    isShowActionsSheet: $showingStatusActionSheet,
                    status: $appState.state.current.pacient.status)

                LineWithActionSheetView(
                    title: "С кем проживает",
                    arrayList: resideArray,
                    isShowActionsSheet: $showingResideStatusActionSheet,
                    status: $appState.state.current.pacient.resideStatus)

                if appState.state.current.pacient.resideStatus == resideArray.last {
                    StringTextFieldView(placeholder: "Введите жильцов", field: $appState.state.current.pacient.resideText)
                        .padding(.top, -10)
                        .padding(.bottom, 10)
                }

                Text("Основные проблемы")
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                VStack(alignment: .leading) {
                    ForEach(appState.state.current.pacient.problems.indices, id: \.self) { index in
                        ProblemCell(problem: $appState.state.current.pacient.problems[index])
                    }.frame(height: 20)
                }

                if appState.state.current.pacient.problems.last?.isSelected == true {
                    StringTextFieldView(placeholder: "Введите проблему", field: $appState.state.current.pacient.specificProblem)
                }

                Spacer()
            }
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(message))
        }
        .gesture(
            TapGesture().onEnded { _ in
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        )
        .navigationBarTitle(Text("Общая информация о пациенте"), displayMode: .inline)
        .navigationBarItems(
            trailing:
                HeaderNextButtonView(action: {
                    if self.validateFields() {
                        appState.state.current.pacient.isSaved = true
                        self.willMoveToBalanceTestViewScreen.toggle()
                    }
                })
        )
        NavigationLink(destination: AnthropometryView(),
                       isActive: $willMoveToBalanceTestViewScreen) { }
    }
    
    private func validateFields() -> Bool {
        guard appState.state.current.pacient.username.count > 2 else {
            message = "Ф.И.О. пациента заполнено некорректно"
            showingAlert.toggle()
            return false
        }
        
        guard (Int(appState.state.current.pacient.age) ?? -1) > 0 else {
            message = "Возраст пациента заполнен некорректно"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.pacient.departament.count > 2 else {
            message = "Отделение пациента заполнено некорректно"
            showingAlert.toggle()
            return false
        }
        
        guard (Int(appState.state.current.pacient.room) ?? -1) > 0 && (Int(appState.state.current.pacient.room) ?? -1) < 150 else {
            message = "№ палаты пациента заполнено некорректно"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.pacient.contactPerson.isEmpty || appState.state.current.pacient.contactPerson.count > 2 else {
            message = "Контактное лицо пациента заполнено некорректно"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.pacient.phoneNumber.count >= 6 && appState.state.current.pacient.phoneNumber.count <= 11 else {
            message = "Номер телефона пациента заполнен некорректно"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.pacient.phoneNumber.count >= 6 && appState.state.current.pacient.phoneNumber.count <= 11 else {
            message = "Ф.И.О. лечащего врача пациента заполнено некорректно"
            showingAlert.toggle()
            return false
        }
        
        guard appState.state.current.pacient.phoneNumber.count >= 6 && appState.state.current.pacient.phoneNumber.count <= 11 else {
            message = "Поле для ввода сожителей пациента заполнено некорректно"
            showingAlert.toggle()
            return false
        }
        
        let selectedPromlems = appState.state.current.pacient.problems.filter { $0.isSelected == true }
        guard !selectedPromlems.isEmpty &&
                (appState.state.current.pacient.problems.last?.isSelected != true || appState.state.current.pacient.specificProblem.count > 2) else {
            message = "Проблема пациента не выбрана или заполнена некорректно"
            showingAlert.toggle()
            return false
        }
        
        return true
    }
}

public extension String {
    func isAgeValid(_ start: Int, _ end: Int) -> Bool {
        guard let num = Int(self), num > start, num < end else {
            return false
        }

        return true
    }
}
