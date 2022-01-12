//
//  ViewController.swift
//  Right on target
//
//  Created by Владимир Амелькин on 20.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    private var currentValue: Int = 0
    
    var game: Game!
    
    override func loadView() {
        super.loadView()
        
        let versionLabel = UILabel(frame: CGRect(x: 20, y:10, width: 200, height: 20))
        versionLabel.text = "Версия 1.1"
        self.view.addSubview(versionLabel)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 0, endValue: 50, lastRound: 3)
        updateLabel()
    }

    @IBAction func checkNumber() {
        guard let game = game, let currentRound = game.currentRound else { return }
        currentRound.calculateScore(with: currentValue)
        
        if game.isGameEnded {
            showAlert(score: game.score)
        } else {
            game.startNewRound()
        }
        
        updateLabel()
    }
    
    @IBAction func move() {
        setCurrentValue()
    }
    
    private func updateLabel() {
        guard let currentRound = game.currentRound else { return }
        label.text = String(currentRound.secretValue)
    }
    
    private func setCurrentValue() {
        currentValue = Int(slider.value.rounded())
    }
    
    private func showAlert(score: Int) {
        let alertController = UIAlertController(
            title: "Игра окончена",
            message: "Ваш счет - \(score)",
            preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: { [weak self] _ in
            guard let self = self else { return }
            self.game.createNewGame()
            self.updateLabel()
        }))
        self.present(alertController, animated: true, completion: nil)
    }
}

