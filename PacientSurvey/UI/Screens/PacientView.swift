//
//  PacientView.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 08.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI
import FloatingLabelTextFieldSwiftUI
import RadioGroup

let statusArray: [String] = ["Женат/замужем", "Не женат/не замужем", "Вдовец/вдова", "В разводе"]
let resideArray: [String] = ["С женой/мужем", "Один", "С детьми", "Другое"]

struct PacientView: View {

    @Binding var isNavigationBarHidden: Bool

    @State private var username: String = ""
    @State private var age: String = ""
    @State private var departament: String = ""
    @State private var room: String = ""
    @State private var receiptDate: String = ""
    @State private var dischargeDate: String = ""
    @State private var status: String = statusArray[0]
    @State private var contactPerson: String = ""
    @State private var phoneNumber: String = ""
    @State private var doctor: String = ""
    @State private var completionDate: String = ""
    @State private var resideStatus: String = resideArray[0]
    @State private var resideText: String = ""
    @State private var problems: [ProblemModal] = [
        ProblemModal(id: 0, title: "общая слабость", isSelected: false),
        ProblemModal(id: 1, title: "утомляемость, снижение мобильности", isSelected: false),
        ProblemModal(id: 2, title: "снижение слуха и зрения", isSelected: false),
        ProblemModal(id: 3, title: "снижение памяти на текущие события", isSelected: false),
        ProblemModal(id: 4, title: "головокружение", isSelected: false),
        ProblemModal(id: 5, title: "запоры", isSelected: false),
        ProblemModal(id: 6, title: "снижение аппетита", isSelected: false),
        ProblemModal(id: 7, title: "снижение эмоциональной стабильности", isSelected: false),
        ProblemModal(id: 8, title: "плаксивость", isSelected: false),
        ProblemModal(id: 9, title: "боли в пояснично-крестцовом отделе", isSelected: false),
        ProblemModal(id: 10, title: "боли в суставах", isSelected: false),
        ProblemModal(id: 11, title: "головная боль", isSelected: false),
        ProblemModal(id: 12, title: "падения шаткости походки", isSelected: false),
        ProblemModal(id: 13, title: "другое", isSelected: false),
    ]
    @State private var specificPromlem: String = ""
    @State private var showingStatusActionSheet = false
    @State private var showingResideStatusActionSheet = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    self.setStringTextField($username, username, "Ф.И.О. пациента")
                    self.setIntTextField($age, age, "Возраст")
                    self.setStringTextField($departament, departament, "Отделение")
                    self.setIntTextField($room, room, "№ палаты")
                    self.setIntTextField($receiptDate, receiptDate, "Дата поступления")
                    self.setIntTextField($dischargeDate, dischargeDate, "Дата выписки")
                    self.setStringTextField($contactPerson, contactPerson, "Контактное лицо")
                    self.setStringTextField($phoneNumber, phoneNumber, "Номер телефона")
                    self.setStringTextField($doctor, doctor, "Ф.И.О, лечащего врача")
                    self.setStringTextField($completionDate, completionDate, "Дата заполнения")
                }
                
                GeometryReader { geometry in
                    VStack(alignment: .leading) {
                        HStack() {
                            Text("Семейный статус:")
                                .fontWeight(.bold)
                                .actionSheet(isPresented: $showingStatusActionSheet) {
                                    ActionSheet(title: Text("Семейный статус"), buttons: statusArray.map { item in
                                        .default(Text(item)) { self.status = item }
                                    })
                                }
                                .multilineTextAlignment(.leading)
                                .frame(width: geometry.size.width / 2)
                            Text(self.status)
                                .multilineTextAlignment(.trailing)
                                .frame(width: geometry.size.width / 2)
                        }
                        .onTapGesture {
                            self.showingStatusActionSheet = true
                        }
                        .padding(.bottom, 5)
                        
                        HStack() {
                            Text("С кем проживает:")
                                .fontWeight(.bold)
                                .actionSheet(isPresented: $showingResideStatusActionSheet) {
                                    ActionSheet(title: Text("С кем проживает"), buttons: resideArray.map { item in
                                        .default(Text(item)) { self.resideStatus = item }
                                    })
                                }
                                .multilineTextAlignment(.leading)
                                .frame(width: geometry.size.width / 2)
                            Text(self.resideStatus)
                                .multilineTextAlignment(.trailing)
                                .frame(width: geometry.size.width / 2)
                        }
                        .onTapGesture {
                            self.showingResideStatusActionSheet = true
                        }
                    }
                    .padding(.top, 15)
                    .padding(.bottom, 15)
                    .padding(.leading, -5)
                }

                if (resideStatus == resideArray[3]) {
                    self.setStringTextField($resideText, resideText, "Введите жильцов")
                        .padding(.top, 50)
                }

                Text("Основные проблемы")
                    .fontWeight(.bold)
                    .padding(.top, resideStatus == resideArray[3] ? 10 : 60)
                    .padding(.leading, 10)
                VStack(alignment: .leading) {
                    ForEach(problems.indices, id: \.self) { index in
                        ProblemModalCell(problem: self.$problems[index])
                    }
                        .frame(height: 20)
                }

                if (self.problems[13].isSelected) {
                    self.setStringTextField($specificPromlem, specificPromlem, "Введите проблему")
                }

                Spacer()
            }
        }
            .navigationBarTitle(
                Text("Общая информация о пациенте").font(.title), displayMode: .inline)
            .onAppear { self.isNavigationBarHidden = false }
    }
}

// MARK: - Displaying TextFields view

private extension PacientView {
    func setStringTextField(_ bindingField: Binding<String>, _ field: String, _ placeholder: String) -> some View {
        FloatingLabelTextField(bindingField, placeholder: placeholder, editingChanged: { (isChanged) in }) { }
            .isShowError(true)
            .addValidations([
                // .init(condition: field.isValid(.alphabetWithSpace), errorMessage: "В поле могут присутствовать только буквы и пробел"),
                .init(condition: field.count >= 2, errorMessage: "В поле должно быть не менее 2-х символов")
                ])
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 60)
            .padding(.horizontal, 10)
            .padding(.vertical, -5)
    }

    func setIntTextField(_ bindingField: Binding<String>, _ field: String, _ placeholder: String) -> some View {
        FloatingLabelTextField(bindingField, placeholder: placeholder, editingChanged: { (isChanged) in }) { }
            .isShowError(true)
            .addValidations([
                    .init(condition: field.isAgeValid(0, 150), errorMessage: "Следует ввести число в диапазоне (0, 150)")
                ])
            .floatingStyle(ThemeTextFieldStyle())
            .frame(height: 60)
            .textContentType(.oneTimeCode)
            .keyboardType(.numberPad)
            .modifier(ThemeTextField())
            .padding(.horizontal, 10)
            .padding(.vertical, -15)
    }
}

// MARK: - Create floating style

struct ThemeTextFieldStyle: FloatingLabelTextFieldStyle {
    func body(content: FloatingLabelTextField) -> FloatingLabelTextField {
        content
            .selectedTextColor(.black)
            .selectedLineColor(.black)
            .selectedTitleColor(.black)
            .textColor(.black)
            .titleColor(.black)
            .lineColor(.black)
            .errorColor(.init(UIColor.red))
    }
}

//MARK: - ViewModifier

struct ThemeTextField: ViewModifier {
    func body(content: Content) -> some View {
        content.frame(height: 70)
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

#if DEBUG
    struct PacientView_Previews: PreviewProvider {
        static var previews: some View {
            PacientView(isNavigationBarHidden: .constant(true))
        }
    }
#endif
