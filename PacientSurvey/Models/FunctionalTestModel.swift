//
//  FunctionalTestModel.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

let speedArray: [String] = [Int](0 ... 50).map {
    let dec = $0 / 10
    let mod = $0 % 10
    return String(dec) + "." + String(mod)
}
let testGetUpAndGoArray: [String] = [Int](5 ... 35).map { String($0) }
let semiTandemPositionArray = ["< 10", ">= 10"]
let tandemPositionArray = ["< 3", "3-9.9", ">= 10"]
let standUpArray: [String] = [Int](5 ... 60).map { String($0) }

struct FunctionalTestModel: Equatable, Codable {
    var isSaved: Bool = false
    var walkingSpeed: Int = -1
    var testGetUpAndGo: Int = -1
    var positionFeetTogether: Int = -1
    var semiTandemPosition: Int = -1
    var tandemPosition: Int = -1
    var standUpIndex: Int = -1
    
    init() {
        self.clear()
    }
    
    mutating func clear() {
        self.isSaved = false
        self.walkingSpeed = -1
        self.testGetUpAndGo = -1
        self.positionFeetTogether = -1
        self.semiTandemPosition = -1
        self.tandemPosition = -1
        self.standUpIndex = -1
    }
    
    static func == (lhs: FunctionalTestModel, rhs: FunctionalTestModel) -> Bool {
        return lhs.isSaved == rhs.isSaved &&
            lhs.walkingSpeed == rhs.walkingSpeed &&
            lhs.testGetUpAndGo == rhs.testGetUpAndGo &&
            lhs.positionFeetTogether == rhs.positionFeetTogether &&
            lhs.semiTandemPosition == rhs.semiTandemPosition &&
            lhs.tandemPosition == rhs.tandemPosition &&
            lhs.standUpIndex == rhs.standUpIndex
    }
}
