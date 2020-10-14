//
//  DBRepository.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

protocol DBRepository {
    func saveToStore(data: AppState.State)
    func loadFromStore() -> AppState.State
}

struct UserDefaultsDBRepository: DBRepository {
    
    func saveToStore(data: AppState.State) {
        if let encoded = try? JSONEncoder().encode(data) {
            let defaults = UserDefaults.standard
            defaults.set(encoded, forKey: "state")
        }
    }
    
    func loadFromStore() -> AppState.State {
        if let savedStore = UserDefaults.standard.object(forKey: "state") as? Data,
           let loadedStore = try? JSONDecoder().decode(AppState.State.self, from: savedStore) {
            return loadedStore
        }
        return AppState.State()
    }
}
