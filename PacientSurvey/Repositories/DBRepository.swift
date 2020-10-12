//
//  DBRepository.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 12.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

import SwiftUI

protocol DBRepository {
    func saveToStore(data: AppState.UserData)
    func loadFromStore() -> AppState.UserData
}

struct UserDefaultsDBRepository: DBRepository {
    
    func saveToStore(data: AppState.UserData) {
        if let encoded = try? JSONEncoder().encode(data) {
            let defaults = UserDefaults.standard
             defaults.set(encoded, forKey: "userData")
        }
    }
    
    func loadFromStore() -> AppState.UserData {
        if let savedStore = UserDefaults.standard.object(forKey: "userData") as? Data,
           let loadedStore = try? JSONDecoder().decode(AppState.UserData.self, from: savedStore) {
            return loadedStore
        }
        return AppState.UserData()
    }
}
