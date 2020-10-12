//
//  AppState.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject, Equatable {
    @Published var userData = UserData()
    @Published var system = System()
}

extension AppState {
    class UserData: Equatable, Codable {
        var pacient = PacientModel()
        var balanceTest = BalanceTestModel()

        static func == (lhs: AppState.UserData, rhs: AppState.UserData) -> Bool {
            return lhs.pacient == rhs.pacient &&
                lhs.balanceTest == rhs.balanceTest
        }
    }
}

extension AppState {
    class System: Equatable {
        var isActive: Bool = false
        var keyboardHeight: CGFloat = 0
        
        static func == (lhs: AppState.System, rhs: AppState.System) -> Bool {
            return lhs.isActive == rhs.isActive &&
                lhs.keyboardHeight == rhs.keyboardHeight
        }
    }
}

func == (lhs: AppState, rhs: AppState) -> Bool {
    return lhs.userData == rhs.userData &&
        lhs.system == rhs.system
}
