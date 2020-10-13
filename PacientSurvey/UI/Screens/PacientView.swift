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
        .gesture(
            TapGesture().onEnded { _ in
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        )
        .navigationBarTitle(Text("Общая информация о пациенте"), displayMode: .inline)
        .navigationBarItems(
            trailing: HeaderNextButtonView(willMoveToNextScreen: $willMoveToBalanceTestViewScreen)
        )        
        NavigationLink(destination: AnthropometryView(),
                       isActive: $willMoveToBalanceTestViewScreen) { }
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
