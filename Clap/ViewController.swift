//
//  ViewController.swift
//  Clap
//
//  Created by Kenta Okuda on 6/8/16.
//  Copyright © 2016 Kenta Okuda. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet var clapPickerView: UIPickerView!
    var audioPlayer: AVAudioPlayer!
    var soundCount: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let soundFilePath = NSBundle.mainBundle().pathForResource("clap", ofType: "wav")
        let fileURL = NSURL(fileURLWithPath: soundFilePath!)
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOfURL: fileURL)
        } catch {
            print("音楽ファイルが読み込めませんでした")
        }
        
        clapPickerView.delegate = self
        clapPickerView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //カテゴリ
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    //選択肢
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    //表示内容
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return "\(row+1)回"
    }
    //選択中のボタン
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        soundCount = row
    }
    
    @IBAction func playButton() {
        audioPlayer.numberOfLoops = soundCount
        audioPlayer.play()
    }

}

