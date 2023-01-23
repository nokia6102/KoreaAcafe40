//
//  ViewController.swift
//  50音練習
//
//  Created by 陳韋綸 on 2022/3/19.
//  Fix iOS16 by Alex on 2023/1/23

import UIKit
import AVFoundation

class HomePageViewController: UIViewController,AVSpeechSynthesizerDelegate {
    
 
    
    private var collectionView: UICollectionView?
    private let changeToneBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemBlue.withAlphaComponent(0.5)
        button.setTitle("Change", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.layer.masksToBounds = true
        return button
    }()
    
    private let speakStartBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.5)
        button.setTitle("Start", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Stop", for: .selected)
        button.setTitleColor(.black, for: .selected)
        button.layer.masksToBounds = true
        return button
    }()
    
    private let speakToneLabel: UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.clipsToBounds = true
        label.textAlignment = .center
        label.backgroundColor = .label
        label.textColor = .systemBackground
        label.font = .systemFont(ofSize: 80, weight: .bold)
        return label
    }()

    var toneBool: Bool = true
    var tone = [String]()
    var toneChinese = [String]()
    var time: Timer? = nil
    var y: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toneBoolChange()
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout())
        collectionView?.delegate = self
        collectionView?.dataSource = self
        collectionView?.register(HomePageCollectionViewCell.self, forCellWithReuseIdentifier: HomePageCollectionViewCell.identifier)
        view.backgroundColor = .systemBackground
        view.addSubview(collectionView!)
        view.addSubview(changeToneBtn)
        view.addSubview(speakStartBtn)
        view.addSubview(speakToneLabel)
        
        changeToneBtn.addTarget(self, action: #selector(didTapChangeTone), for: .touchUpInside)
        speakStartBtn.addTarget(self, action: #selector(didTapSpeakStart), for: .touchUpInside)
        
        model.delegate = self
    }
    let model = AVSpeechSynthesizer()
    var bombSoundEffect: AVAudioPlayer?

//    @objc private func didplus() {
//        if y >= tone.count {
//            y = 0
//            return
//        }
//
//        let utten = AVSpeechUtterance(string: tone[y])
//        speakToneLabel.text = tone[y]
//
//        y += 1
//        collectionView?.reloadData()
//        //https://gist.github.com/Koze/d1de49c24fc28375a9e314c72f7fdae4
////        utten.voice = AVSpeechSynthesisVoice(language: "ja-JP, Name: Kyoko, Quality: Default [com.apple.ttsbundle.Kyoko-compact]")
//        utten.voice = AVSpeechSynthesisVoice(language: "ko-KR")
//        model.speak(utten)
//
//
//    }
  
    @objc private func didplus() {
        while y < tone.count {
            if tone[y] == " " {
                y += 1
                continue
            }
            let utten = AVSpeechUtterance(string: tone[y])
            speakToneLabel.text = tone[y]
            y += 1
            collectionView?.reloadData()
            utten.voice = AVSpeechSynthesisVoice(language: "ko-KR")
            utten.rate = 0.4
//            utten.voice = AVSpeechSynthesisVoice(language: "ko-KR, Name: Yuna, Quality: Default [com.apple.ttsbundle.Yuna-compact]")
            utten.rate = 0.4
            print (tone[y-1])
            print (tone[y-1] == "ㅢ")
            
            if tone[y-1] == "ㅢ"{
                playWord(char: tone[y-1])
            }else{
                if y<36{
                    model.speak(utten)
                }else{
                    playWord(char: tone[y-1])
                }
            }
            break
        }
        
    }

    @objc private func didTapSpeakStart() {
        if time == nil {
            speakStartBtn.isSelected = true
          //  y = 0
            time = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(didplus), userInfo: nil, repeats: true)
        }
        else {
            speakStartBtn.isSelected = false
            y = 0
            speakToneLabel.text = ""
            collectionView?.reloadData()
            time?.invalidate()
            time = nil
        }
    }
    
    @objc private func didTapChangeTone() {
        toneBool = !toneBool
        toneBoolChange()
    }
    
    func toneBoolChange() {
        if toneBool {
            tone = Tone.shared.hiraganaTone()
        }
        else {
            tone = Tone.shared.hiraganaTone()
            toneChinese = Tone.shared.chineseTone()
        }
        collectionView?.reloadData()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView?.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height-100)
        changeToneBtn.frame = CGRect(x: view.right-100, y: view.bottom-100, width: 80, height: 80)
        speakStartBtn.frame = CGRect(x: 20, y: view.bottom-100, width: 80, height: 80)
        speakToneLabel.frame = CGRect(x: (speakStartBtn.left-changeToneBtn.right-80)/2+changeToneBtn.right, y: view.bottom-120, width: 80, height: 80)
        
        changeToneBtn.layer.cornerRadius = changeToneBtn.width/2
        speakStartBtn.layer.cornerRadius = speakStartBtn.width/2
        speakToneLabel.layer.cornerRadius = speakToneLabel.width/2
    }
    
    func layout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: view.width/8, height: view.width/8)
        layout.scrollDirection = .vertical 
        layout.sectionInset = UIEdgeInsets(top: 6, left: 6, bottom: 6, right: 6)
        return layout
    }
    
   
    
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tone.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomePageCollectionViewCell.identifier, for: indexPath) as? HomePageCollectionViewCell else {
            return UICollectionViewCell()
        }
        if toneBool {
            if indexPath.row == y - 1 {
                cell.configure(word: tone[indexPath.row], select: true)
                if y == tone.count {
                    y = 0
                }
            }
            else {
                cell.configure(word: tone[indexPath.row], select: false)
            }
        }else{
            if indexPath.row == y - 1 {
                cell.configure(word: toneChinese[indexPath.row], select: true)
                if y == tone.count {
                    y = 0
                }
            }
            else {
                cell.configure(word: toneChinese[indexPath.row], select: false)
            }
        }
        return cell
    }
    
  
    func playWord(char:String){
        let url = Bundle.main.url(forResource: char, withExtension: "mp3")!
           do {
               bombSoundEffect = try AVAudioPlayer(contentsOf: url)
               guard let bombSound = bombSoundEffect else { return }

               bombSound.prepareToPlay()
               bombSound.play()
           } catch let error {
               print(error.localizedDescription)
           }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        speakStartBtn.isSelected = false
        y = indexPath.row + 1
        collectionView.reloadData()
        time?.invalidate()
        time = nil
        
        speakToneLabel.text = tone[indexPath.row]
        let utten = AVSpeechUtterance(string: tone[indexPath.row])
        utten.voice = AVSpeechSynthesisVoice(language: "ko-KR")
        //let model = AVSpeechSynthesizer()
        utten.rate = 0.4
        print (tone[y-1])
        print (tone[y-1] == "ㅢ")
        
        if tone[y-1] == "ㅢ"{
            playWord(char: tone[y-1])
        }else{
            if y<36{
                model.speak(utten)
            }else{
                playWord(char: tone[y-1])
            }
        }
//        model.speak(utten)
    }
    
    
}
