//
//  GameRound.swift
//  Right on target
//
//  Created by Владимир Амелькин on 12.01.2022.
//

import Foundation

protocol GameRoundProtocol {
    
    // Отклонение от правильного значения
    var delta: Int { get }
    // Загаданное значение
    var secretValue: Int { get }
    // Сравнивает переданное значение с загаданным и начисляет очки
    func calculateScore(with value: Int)
}

class GameRound: GameRoundProtocol {
    var delta: Int = 0
    var secretValue: Int = 0
    
    init(secretValue: Int) {
        self.secretValue = secretValue
    }
    
    func calculateScore(with value: Int) {
        delta = abs(secretValue - value)
    }
}
