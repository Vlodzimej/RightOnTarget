//
//  Game.swift
//  Right on target
//
//  Created by Владимир Амелькин on 12.01.2022.
//

import Foundation

protocol GameProtocol {

    // Проверяет, закончена ли игра
    var isGameEnded: Bool { get }
    var currentRound: GameRound? { get }
    var score: Int { get }
    // Начинает новую игру и сразу стартует первый раунд
    func createNewGame()
    // Начинает новый раунд (обновляет загаданное число)
    func startNewRound()

}

class Game: GameProtocol {

    // Количество раундов
    private var lastRound: Int
    // Количество завершенных раундов
    private var rounds: [GameRound]
    private var secretValueGenerator: GeneratorProtocol
    private var maxValue: Int
    
    var currentRound: GameRound? {
        return rounds.last
    }
    
    var isGameEnded: Bool {
        rounds.count >= lastRound
    }
    
    var score: Int {
        var delta = self.rounds.reduce(0, { a, b in
            a + b.delta
        })
        return maxValue - delta / rounds.count
    }
    
    init?(startValue: Int, endValue: Int, lastRound: Int) {
        guard startValue <= endValue else {
            return nil
        }
        self.maxValue = endValue
        self.lastRound = lastRound
        self.rounds = []
        self.secretValueGenerator = Generator(startValue: startValue, endValue: endValue)
        self.createNewGame()
    }
    
    func startNewRound() {
        let currentRound = getNewRound()
        rounds.append(currentRound)
    }
    
    func createNewGame() {
        self.rounds = []
        startNewRound()
    }
    
    private func getNewRound() -> GameRound {
        let secretValue = secretValueGenerator.getRandomValue()
        return GameRound(secretValue: secretValue)
    }
}
