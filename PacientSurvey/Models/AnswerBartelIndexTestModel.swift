//
//  AnswerBartelIndexTestModel.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 13.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

let eatingTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в помощи, способен самостоятельно пользоваться всеми необходимыми столовыми приборами",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "частично нуждаюсь в помощи, например, при разрезании пищи",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "полностью зависим от окружающих (необходимо кормление с посторонней помощью)",
        size: 0)
]

let hygieneTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в помощи",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "нуждаюсь в помощи",
        size: 0)
]

let dressingTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в посторонней помощи",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "частично нуждаюсь в помощи, например, при одевании обуви, застегивании пуговиц и т.д.",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "полностью нуждаюсь в посторонней помощи",
        size: 0)
]

let takingBathTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "принимаю ванну без посторонней помощи",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "нуждаюсь в посторонней помощи",
        size: 0)
]

let urinationControlTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в помощи",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "частично нуждаюсь в помощи (при использовании клизмы, свечей, катетера)",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "полностью нуждаюсь в помощи в связи с грубым нарушением тазовых функций",
        size: 0)
]

let bowelControlTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в помощи",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "частично нуждаюсь в помощи (при использовании клизмы, свечей, катетера)",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "полностью нуждаюсь в помощи в связи с грубым нарушением тазовых функций",
        size: 0)
]

let goingToToiletTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в помощи",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "частично нуждаюсь в помощи (удержание равновесия, использование туалетной бумаги, снятие и надевание брюк и т.д.)",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "нуждаюсь в использовании судна, утки",
        size: 0)
]

let gettingOutOfBedTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в помощи",
        size: 15),
    AnswerBartelIndexTestModel(
        title: "нуждаюсь в наблюдении или минимальной поддержки",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "могу сесть в постели, но для того, чтобы встать, нужна существенная поддержка",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "не способен встать с постели даже с посторонней помощью",
        size: 0)
]

let movementTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "могу без посторонней помощи передвигаться на расстояние от 50 м",
        size: 15),
    AnswerBartelIndexTestModel(
        title: "могу передвигаться с посторонней помощью в пределах 50м",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "могу передвигаться с помощью инвалидной коляски",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "не способен к передвижению",
        size: 0)
]

let climbingTheStairsTypes: [AnswerBartelIndexTestModel] = [
    AnswerBartelIndexTestModel(
        title: "не нуждаюсь в помощи",
        size: 10),
    AnswerBartelIndexTestModel(
        title: "нуждаюсь в наблюдении или поддержке",
        size: 5),
    AnswerBartelIndexTestModel(
        title: "не способен подниматься по лестнице даже с поддержкой",
        size: 0)
]

struct AnswerBartelIndexTestModel: Codable, Identifiable {
    public let id: UUID
    public var title: String
    public var size: Int
    
    init(title: String, size: Int) {
        self.id = UUID()
        self.title = title
        self.size = size
    }
}
