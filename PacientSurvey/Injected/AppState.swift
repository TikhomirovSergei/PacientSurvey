//
//  AppState.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

class AppState: ObservableObject {
    @Published var state = State()
    @Published var system = System()
}

extension AppState {
    class State: Codable {
        var current = UserData()
        var all: [UserData] = [UserData()]
    }
}

extension AppState {
    class UserData: Codable {
        var pacient = PacientModel()
        var anthropometry = AnthropometryModel()
        var functionalTest = FunctionalTestModel()
        var screeningTest = ScreeningTestModel()
        
        func clear() {
            self.pacient = PacientModel()
            self.anthropometry = AnthropometryModel()
            self.functionalTest = FunctionalTestModel()
            self.screeningTest = ScreeningTestModel()
        }
    }
}

extension AppState {
    class System {
        var isActive: Bool = false
        var keyboardHeight: CGFloat = 0
    }
}
