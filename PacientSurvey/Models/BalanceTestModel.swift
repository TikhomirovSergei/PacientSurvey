//
//  BalanceTestModel.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

let heightArray: [String] = [Int](130 ... 200).map { String($0) }
let weightArray: [String] = [Int](400 ... 2000).map {
    let dec = $0 / 10
    let mod = $0 % 10
    return String(dec) + "," + String(mod)
}
let waistCircumferenceArray: [String] = [Int](60 ... 160).map { String($0) }
let BMIArray: [String] = [Int](15 ... 50).map { String($0) }
let volumeArray: [String] = [Int](25 ... 100).map { String($0) }
let speedArray: [String] = [Int](0 ... 50).map {
    let dec = $0 / 10
    let mod = $0 % 10
    return String(dec) + "," + String(mod)
}
let semiTandemPositionArray = ["< 10", ">= 10"]
let tandemPositionArray = ["< 3", "3-9.9", ">= 10"]
let standUpArray: [String] = [Int](5 ... 60).map { String($0) }

struct BalanceTestModel: Equatable, Codable {
    var isSaved: Bool = false
    var heightIndex: Int = -1
    var weightIndex: Int = -1
    var growthInYouth: Int = -1
    var BMI: Int = -1
    var waistCircumference: Int = -1
    var shinVolume: Int = -1
    var shoulderVolume: Int = -1
    var walkingSpeed: Int = -1
    var positionFeetTogether: Int = -1
    var semiTandemPosition: Int = -1
    var tandemPosition: Int = -1
    var standUpIndex: Int = -1
    
    init() {
        self.clear()
    }
    
    mutating func clear() {
        self.isSaved = false
        self.heightIndex = -1
        self.weightIndex = -1
        self.growthInYouth = -1
        self.BMI = -1
        self.waistCircumference = -1
        self.shinVolume = -1
        self.shoulderVolume = -1
        self.walkingSpeed = -1
        self.positionFeetTogether = -1
        self.semiTandemPosition = -1
        self.tandemPosition = -1
        self.standUpIndex = -1
    }
    
    static func == (lhs: BalanceTestModel, rhs: BalanceTestModel) -> Bool {
        return lhs.isSaved == rhs.isSaved &&
            lhs.heightIndex == rhs.heightIndex &&
            lhs.weightIndex == rhs.weightIndex &&
            lhs.growthInYouth == rhs.growthInYouth &&
            lhs.BMI == rhs.BMI &&
            lhs.waistCircumference == rhs.waistCircumference &&
            lhs.shinVolume == rhs.shinVolume &&
            lhs.shoulderVolume == rhs.shoulderVolume &&
            lhs.walkingSpeed == rhs.walkingSpeed &&
            lhs.positionFeetTogether == rhs.positionFeetTogether &&
            lhs.semiTandemPosition == rhs.semiTandemPosition &&
            lhs.tandemPosition == rhs.tandemPosition &&
            lhs.standUpIndex == rhs.standUpIndex
    }
}
