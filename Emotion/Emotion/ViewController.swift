//
//  ViewController.swift
//  Emotion
//
//  Created by JunHwan Kim on 2023/07/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var emotionMenuButtonList: [UIButton]!
    var emotionScoreList: [Int] = Array(repeating: 0, count: Emotion.allCases.count)
    let appendScoreList: [Int] = [1, 5, 10]

    override func viewDidLoad() {
        super.viewDidLoad()
        bindEmotionScore()
        emotionMenuButtonList.forEach { button in
            setButton(button: button)
        }
    }
    
    func setButton(button: UIButton) {
        guard let emotion = Emotion(rawValue: button.tag) else { return }
        var menuList: [UIMenuElement] = []
        appendScoreList.forEach { num in
            let action = UIAction(title: "\(num)점 더하기") { _ in
                self.emotionScoreList[button.tag] += num
                self.printEmotionScore(emotion: emotion)
                self.saveScore(emotion: emotion)
            }
            menuList.append(action)
        }
        let resetScore = UIAction(title: "점수 리셋") { _ in
            self.emotionScoreList[button.tag] = 0
            self.printEmotionScore(emotion: emotion)
            self.saveScore(emotion: emotion)
        }
        menuList.append(resetScore)
        button.menu = UIMenu(children: menuList)
    }

    @IBAction func tapEmotion(_ sender: UIButton) {
        guard let emotion = Emotion(rawValue: sender.tag) else { return }
        emotionScoreList[emotion.rawValue] += 1
        saveScore(emotion: emotion)
        printEmotionScore(emotion: emotion)
    }
    
    func printEmotionScore(emotion: Emotion) {
        print("\(emotion.currentCase()) \(emotionScoreList[emotion.rawValue])")
    }
    
    func bindEmotionScore() {
        Emotion.allCases.forEach { emotion in
            emotionScoreList[emotion.rawValue] = emotion.getEmotionScore()
        }
    }
    
    func saveScore(emotion: Emotion) {
        UserDefaults.standard.setValue(emotionScoreList[emotion.rawValue], forKey: emotion.currentCase())
    }
    
}

