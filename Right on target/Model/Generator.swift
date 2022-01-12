//
//  Generator.swift
//  Right on target
//
//  Created by Владимир Амелькин on 12.01.2022.
//

import Foundation

protocol GeneratorProtocol {
    func getRandomValue() -> Int
}

class Generator: GeneratorProtocol {
    // Минимальное загаданное значение
    private var minSecretValue: Int
    // Максимальное загаданное значение
    private var maxSecretValue: Int
    
    init(startValue: Int, endValue: Int) {
        minSecretValue = startValue
        maxSecretValue = endValue
    }
    //Загадать случайное число
    func getRandomValue() -> Int {
        return (minSecretValue...maxSecretValue).randomElement()!
    }
}
