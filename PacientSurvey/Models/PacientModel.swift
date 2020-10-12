//
//  PacientModel.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

let statusArray: [String] = ["Женат/замужем", "Не женат/не замужем", "Вдовец/вдова", "В разводе"]
let resideArray: [String] = ["С женой/мужем", "Один", "С детьми", "Другое"]
let problemsArray = [
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

struct PacientModel: Equatable, Codable {
    var isSaved: Bool = false
    var username: String = ""
    var age: String = ""
    var departament: String = ""
    var room: String = ""
    var contactPerson: String = ""
    var phoneNumber: String = ""
    var doctorName: String = ""
    var receiptDate: Date = Date()
    var status: String = statusArray[0]
    var resideStatus: String = resideArray[0]
    var resideText: String = ""
    var problems: [ProblemModel] = problemsArray
    var specificProblem: String = ""
    
    init() {
        self.clear()
    }
    
    mutating func clear() {
        isSaved = false
        username = ""
        age = ""
        departament = ""
        room = ""
        contactPerson = ""
        phoneNumber = ""
        doctorName = ""
        receiptDate = Date()
        status = statusArray[0]
        resideStatus = resideArray[0]
        resideText = ""
        problems = problemsArray
        specificProblem = ""
    }
    
    static func == (lhs: PacientModel, rhs: PacientModel) -> Bool {
        return lhs.isSaved == rhs.isSaved &&
            lhs.username == rhs.username &&
            lhs.age == rhs.age &&
            lhs.departament == rhs.departament &&
            lhs.room == rhs.room &&
            lhs.contactPerson == rhs.contactPerson &&
            lhs.phoneNumber == rhs.phoneNumber &&
            lhs.doctorName == rhs.doctorName &&
            lhs.receiptDate == rhs.receiptDate &&
            lhs.status == rhs.status &&
            lhs.resideStatus == rhs.resideStatus &&
            lhs.resideText == rhs.resideText &&
            lhs.problems.count == rhs.problems.count &&
            lhs.specificProblem == rhs.specificProblem
    }
}
