//
//  Emotion.swift
//  Emotion
//
//  Created by JunHwan Kim on 2023/07/25.
//

import Foundation

enum Emotion: Int, CaseIterable {
    case veryGood = 0
    case good
    case soso
    case sad
    case verySad
    
    func currentCase() -> String {
        switch self {
        case .veryGood:
            return "veryGood"
        case .good:
            return "good"
        case .soso:
            return "soso"
        case .sad:
            return "sad"
        case .verySad:
            return "verySad"
        }
    }
    
    func getEmotionScore() -> Int {
        return UserDefaults.standard.integer(forKey: currentCase())
    }
}
