//
//  CheckBoxItem.swift
//  PacientSurvey
//
//  Created by Sergey Tikhomirov on 08.10.2020.
//  Copyright © 2020 Sergey Tikhomirov. All rights reserved.
//

public struct ProblemModel: Codable, Identifiable {
    public let id: Int
    public var title: String
    public var isSelected: Bool
    
    init(id: Int, title: String, isSelected: Bool) {
        self.id = id
        self.title = title
        self.isSelected = isSelected
    }
}
