//
//  ScreeningTestModel.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

struct ScreeningTestModel: Equatable, Codable {
    var isSaved: Bool = false
    var isLostWeight: Bool = false
    var isReducedVisionOrHearing: Bool = false
    var isFallInjuries: Bool = false
    var isDepressedMood: Bool = false
    var isMemoryProblems: Bool = false
    var isUrinaryIncontinence: Bool = false
    var isDifficultToMove: Bool = false
    
    init() {
        self.clear()
    }
    
    mutating func clear() {
        self.isSaved = false
        self.isLostWeight = false
        self.isReducedVisionOrHearing = false
        self.isFallInjuries = false
        self.isDepressedMood = false
        self.isMemoryProblems = false
        self.isUrinaryIncontinence = false
        self.isDifficultToMove = false
    }
    
    static func == (lhs: ScreeningTestModel, rhs: ScreeningTestModel) -> Bool {
        return lhs.isSaved == rhs.isSaved &&
            lhs.isLostWeight == rhs.isLostWeight &&
            lhs.isReducedVisionOrHearing == rhs.isReducedVisionOrHearing &&
            lhs.isFallInjuries == rhs.isFallInjuries &&
            lhs.isDepressedMood == rhs.isDepressedMood &&
            lhs.isMemoryProblems == rhs.isMemoryProblems &&
            lhs.isUrinaryIncontinence == rhs.isUrinaryIncontinence &&
            lhs.isDifficultToMove == rhs.isDifficultToMove
    }
}
