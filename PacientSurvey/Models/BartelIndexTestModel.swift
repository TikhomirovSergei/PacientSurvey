//
//  BartelIndexTestModel.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 13.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct BartelIndexTestModel: Equatable, Codable {
    var isSaved: Bool = false
    var eatingTypesSelectedIndex = -1
    var hygieneSelectedIndex = -1
    var dressingSelectedIndex = -1
    var takingBathSelectedIndex = -1
    var urinationControlSelectedIndex = -1
    var bowelControlSelectedIndex = -1
    var goingToToiletSelectedIndex = -1
    var gettingOutOfBedSelectedIndex = -1
    var movementSelectedIndex = -1
    var climbingTheStairsSelectedIndex = -1
    
    init() {
        self.clear()
    }
    
    mutating func clear() {
        self.isSaved = false
        self.eatingTypesSelectedIndex = -1
        self.hygieneSelectedIndex = -1
        self.dressingSelectedIndex = -1
        self.takingBathSelectedIndex = -1
        self.urinationControlSelectedIndex = -1
        self.bowelControlSelectedIndex = -1
        self.goingToToiletSelectedIndex = -1
        self.gettingOutOfBedSelectedIndex = -1
        self.movementSelectedIndex = -1
        self.climbingTheStairsSelectedIndex = -1
    }
    
    static func == (lhs: BartelIndexTestModel, rhs: BartelIndexTestModel) -> Bool {
        return lhs.isSaved == rhs.isSaved &&
            lhs.eatingTypesSelectedIndex == rhs.eatingTypesSelectedIndex &&
            lhs.hygieneSelectedIndex == rhs.hygieneSelectedIndex &&
            lhs.dressingSelectedIndex == rhs.dressingSelectedIndex &&
            lhs.takingBathSelectedIndex == rhs.takingBathSelectedIndex &&
            lhs.urinationControlSelectedIndex == rhs.urinationControlSelectedIndex &&
            lhs.bowelControlSelectedIndex == rhs.bowelControlSelectedIndex &&
            lhs.goingToToiletSelectedIndex == rhs.goingToToiletSelectedIndex &&
            lhs.gettingOutOfBedSelectedIndex == rhs.gettingOutOfBedSelectedIndex &&
            lhs.movementSelectedIndex == rhs.movementSelectedIndex &&
            lhs.climbingTheStairsSelectedIndex == rhs.climbingTheStairsSelectedIndex
    }
}
