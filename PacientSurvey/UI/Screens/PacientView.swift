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
                    StringTextFieldView(placeholder: "Ф.И.О. пациента", field: $appState.userData.pacient.username)
                    NumberTextFieldView(placeholder: "Возраст", isPhoneNumber: false, field: $appState.userData.pacient.age)
                    StringTextFieldView(placeholder: "Отделение", field: $appState.userData.pacient.departament)
                    NumberTextFieldView(placeholder: "№ палаты", isPhoneNumber: false, field: $appState.userData.pacient.room)
                    StringTextFieldView(placeholder: "Контактное лицо", field: $appState.userData.pacient.contactPerson)
                    NumberTextFieldView(placeholder: "Номер телефона", isPhoneNumber: true, field: $appState.userData.pacient.phoneNumber)
                    StringTextFieldView(placeholder: "Ф.И.О. лечащего врача", field: $appState.userData.pacient.doctorName)
                }

                LineWithDatePicker(title: "Дата поступления", date: $appState.userData.pacient.receiptDate)

                LineWithActionSheetView(
                    title: "Семейный статус",
                    arrayList: statusArray,
                    isShowActionsSheet: $showingStatusActionSheet,
                    status: $appState.userData.pacient.status)

                LineWithActionSheetView(
                    title: "С кем проживает",
                    arrayList: resideArray,
                    isShowActionsSheet: $showingResideStatusActionSheet,
                    status: $appState.userData.pacient.resideStatus)

                if appState.userData.pacient.resideStatus == resideArray.last {
                    StringTextFieldView(placeholder: "Введите жильцов", field: $appState.userData.pacient.resideText)
                        .padding(.top, -10)
                        .padding(.bottom, 10)
                }

                Text("Основные проблемы")
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                VStack(alignment: .leading) {
                    ForEach(appState.userData.pacient.problems.indices, id: \.self) { index in
                        ProblemCell(problem: $appState.userData.pacient.problems[index])
                    }.frame(height: 20)
                }

                if appState.userData.pacient.problems.last?.isSelected == true {
                    StringTextFieldView(placeholder: "Введите проблему", field: $appState.userData.pacient.specificProblem)
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
