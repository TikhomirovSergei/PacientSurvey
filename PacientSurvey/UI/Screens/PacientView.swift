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
    @State var username: String = ""
    @State var age: String = ""
    @State var departament: String = ""
    @State var room: String = ""
    @State var contactPerson: String = ""
    @State var phoneNumber: String = ""
    @State var doctorName: String = ""
    @State var receiptDate: Date = Date()
    @State var status: String = statusArray[0]
    @State var resideStatus: String = resideArray[0]
    @State var resideText: String = ""
    @State private var problems: [ProblemModel] = [
        ProblemModel(id: 0, title: "общая слабость", isSelected: false),
        ProblemModel(id: 1, title: "утомляемость, снижение мобильности", isSelected: false),
        ProblemModel(id: 2, title: "снижение слуха и зрения", isSelected: false),
        ProblemModel(id: 3, title: "снижение памяти на текущие события", isSelected: false),
        ProblemModel(id: 4, title: "головокружение", isSelected: false),
        ProblemModel(id: 5, title: "запоры", isSelected: false),
        ProblemModel(id: 6, title: "снижение аппетита", isSelected: false),
        ProblemModel(id: 7, title: "снижение эмоциональной стабильности", isSelected: false),
        ProblemModel(id: 8, title: "плаксивость", isSelected: false),
        ProblemModel(id: 9, title: "боли в пояснично-крестцовом отделе", isSelected: false),
        ProblemModel(id: 10, title: "боли в суставах", isSelected: false),
        ProblemModel(id: 11, title: "головная боль", isSelected: false),
        ProblemModel(id: 12, title: "падения шаткости походки", isSelected: false),
        ProblemModel(id: 13, title: "другое", isSelected: false)
    ]
    @State var specificProblem: String = ""
    @State private var showingStatusActionSheet = false
    @State private var showingResideStatusActionSheet = false
    @State private var showSheetView = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    StringTextFieldView(placeholder: "Ф.И.О. пациента", field: $username)
                    NumberTextFieldView(placeholder: "Возраст", isPhoneNumber: false, field: $age)
                    StringTextFieldView(placeholder: "Отделение", field: $departament)
                    NumberTextFieldView(placeholder: "№ палаты", isPhoneNumber: false, field: $room)
                    StringTextFieldView(placeholder: "Контактное лицо", field: $contactPerson)
                    NumberTextFieldView(placeholder: "Номер телефона", isPhoneNumber: true, field: $phoneNumber)
                    StringTextFieldView(placeholder: "Ф.И.О. лечащего врача", field: $doctorName)
                }

                LineWithDatePicker(title: "Дата поступления", date: $receiptDate)

                LineWithActionSheetView(
                    title: "Семейный статус",
                    arrayList: statusArray,
                    isShowActionsSheet: $showingStatusActionSheet,
                    status: $status)

                LineWithActionSheetView(
                    title: "С кем проживает",
                    arrayList: resideArray,
                    isShowActionsSheet: $showingResideStatusActionSheet,
                    status: $resideStatus)

                if resideStatus == resideArray.last {
                    StringTextFieldView(placeholder: "Введите жильцов", field: $resideText)
                        .padding(.top, -10)
                        .padding(.bottom, 10)
                }

                Text("Основные проблемы")
                    .fontWeight(.bold)
                    .padding(.leading, 10)
                VStack(alignment: .leading) {
                    ForEach(problems.indices, id: \.self) { index in
                        ProblemCell(problem: self.$problems[index])
                    }.frame(height: 20)
                }

                if self.problems.last?.isSelected == true {
                    StringTextFieldView(placeholder: "Введите проблему", field: $specificProblem)
                }

                Spacer()
            }
        }
        .navigate(to: BalanceTestView(), when: $showSheetView)
        .gesture(
            TapGesture().onEnded { _ in
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
        )
        .navigationBarTitle(Text("Общая информация о пациенте"), displayMode: .inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading:
                Button(action: {
                    self.showSheetView.toggle()
                }) {
                    Image(systemName: "chevron.left").font(Font.system(.title))
                },
            trailing:
                Button(action: {
                    self.showSheetView.toggle()
                }) {
                    Image(systemName: "chevron.right").font(Font.system(.title))
                }
        )
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
