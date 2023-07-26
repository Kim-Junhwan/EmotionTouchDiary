//
//  EmotionScoreViewController.swift
//  Emotion
//
//  Created by JunHwan Kim on 2023/07/25.
//

import UIKit

class EmotionScoreViewController: UIViewController {

    @IBOutlet var emotionScoreViewList: [UIStackView]!
    
    @IBOutlet var scoreLabelList: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layout()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        bindEmotionScore()
    }
    
    func bindEmotionScore() {
        scoreLabelList.forEach { scoreLabel in
            scoreLabel.text = "\(Emotion(rawValue: scoreLabel.tag)?.getEmotionScore() ?? 0)" 
        }
    }
    
    func layout() {
        emotionScoreViewList.forEach { emotionView in
            layoutEmotionScoreView(view: emotionView)
        }
    }
    
    func layoutEmotionScoreView(view: UIView) {
        view.layer.cornerRadius = 10.0
    }

}
