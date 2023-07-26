# 2023 07월 25일 새싹 007회차 과제

## 기능

- 각 감정을 클릭 할 시 각 감정별 클릭 횟수가 프린트됩니다.
- 각 감정별 pull down button을 이용해 클릭 횟수를 한번에 +1, +5, +10을 할 수 있고 클릭 횟수를 0으로 초기화 할 수 있습니다.
- 각 감정별 터치 횟수는 2번째 화면에서 확인 할 수 있습니다.
- UserDefault로 데이터를 저장하여 앱을 껐다 켜도 데이터가 저장되도록 했습니다.

<img src="https://github.com/Kim-Junhwan/EmotionTouchDiary/assets/58679737/c37edc3e-0a69-4de4-a102-0c59ff5fc7bd" width="600" height="450"/>


## 고민한 부분
감정 타입인 Emotion에 case를 추가한다고 가정하면 ViewController에 점수를 저장하는 배열을 다음과 같이 선언하게 되면, 감정을 추가할때마다 개발자가 일일히 배열에 감정을 추가 해야한다. 이는 감정을 추가하고 배열에 값을 추가 안할 시, 컴파일 타임에 잡히지 않으며 이는 런타임 에러가 나는 원인이 된다.
``` swift

var emotionScoreList: [Int] = [0, 0, 0, 0, 0]

@IBAction func tapEmotion(_ sender: UIButton) {
        emotionScoreList[sender.tag] += 1
    }

```

이를 해결하기 위해 Emotion에 CaseIterable을 채택하여 Emotion의 값을 배열로 리턴 할 수 있게 하여 Emotion의 case 개수에 따라 점수 배열을 초기화 할 수 있게 해주었다.
``` swift

enum Emotion: Int, CaseIterable {
    case veryGood = 0
    case good
    case soso
    case sad
    case verySad
}

var emotionScoreList: [Int] = Array(repeating: 0, count: Emotion.allCases.count)

@IBAction func tapEmotion(_ sender: UIButton) {
        guard let emotion = Emotion(rawValue: sender.tag) else { return }
        emotionScoreList[emotion.rawValue] += 1
        printEmotionScore(emotion: emotion)
    }
    
    func printEmotionScore(emotion: Emotion) {
        print("\(emotion.currentCase()) \(emotionScoreList[emotion.rawValue])")
    }

```
