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
    
    @State var eatingTypesSelectedIndex = -1
    @State var hygieneSelectedIndex = -1
    @State var dressingSelectedIndex = -1
    @State var takingBathSelectedIndex = -1
    @State var urinationControlSelectedIndex = -1
    @State var bowelControlSelectedIndex = -1
    @State var goingToToiletSelectedIndex = -1
    @State var gettingOutOfBedSelectedIndex = -1
    @State var movementSelectedIndex = -1
    @State var climbingTheStairsSelectedIndex = -1

    init() {
        UITableView.appearance().contentInset.top = 0
    }
    
    var body: some View {
        Form {
            BartelIndexTestItemView(title: "Прием пищи",
                                    answerlist: eatingTypes,
                                    selectedIndex: $eatingTypesSelectedIndex)
            BartelIndexTestItemView(title: "Личная гигиена (умывание, чистка зубов, бритье)",
                                    answerlist: hygieneTypes,
                                    selectedIndex: $hygieneSelectedIndex)
            BartelIndexTestItemView(title: "Одевание",
                                    answerlist: dressingTypes,
                                    selectedIndex: $dressingSelectedIndex)
            BartelIndexTestItemView(title: "Прием ванны",
                                    answerlist: takingBathTypes,
                                    selectedIndex: $takingBathSelectedIndex)
            BartelIndexTestItemView(title: "Контроль мочеиспускания",
                                    answerlist: urinationControlTypes,
                                    selectedIndex: $urinationControlSelectedIndex)
            BartelIndexTestItemView(title: "Контроль дефекации",
                                    answerlist: bowelControlTypes,
                                    selectedIndex: $bowelControlSelectedIndex)
            BartelIndexTestItemView(title: "Посещение туалета",
                                    answerlist: goingToToiletTypes,
                                    selectedIndex: $goingToToiletSelectedIndex)
            BartelIndexTestItemView(title: "Вставание с постели",
                                    answerlist: gettingOutOfBedTypes,
                                    selectedIndex: $gettingOutOfBedSelectedIndex)
            BartelIndexTestItemView(title: "Передвижение (кровать, стул)",
                                    answerlist: movementTypes,
                                    selectedIndex: $movementSelectedIndex)
            BartelIndexTestItemView(title: "Подъем по лестнице",
                                    answerlist: climbingTheStairsTypes,
                                    selectedIndex: $climbingTheStairsSelectedIndex)
        }
        .padding(.horizontal, -15)
        .navigationBarTitle(Text("Индекс Бартел"), displayMode: .inline)
    }
}
