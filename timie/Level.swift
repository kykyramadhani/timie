//
//  Level.swift
//  timie
//
//  Created by Kyky on 17/04/26.
//

import Foundation

struct Level: Identifiable {
    let id: UUID = UUID()
    var levelName: String
    var cookingDuration: String
    var description: String
    var illustration: String
}


