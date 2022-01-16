//
//  ViewController.swift
//  ch13 audio
//
//  Created by 이전희 on 2022/01/16.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate,AVAudioRecorderDelegate {
    
    let playImg = UIImage(named: "play.png")
    let pauseImg = UIImage(named: "pause.png")
    let stopImg = UIImage(named: "stop.png")
    let recordImg = UIImage(named: "record.png")

    
    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    var progressTimer : Timer!
    
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)

    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    @IBOutlet var btnPlay: UIButton!
    @IBOutlet var btnPause: UIButton!
    @IBOutlet var btnStop: UIButton!
    @IBOutlet var slVolume: UISlider!
    
    @IBOutlet var lblRecord: UILabel!
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    @IBOutlet var imgView: UIImageView!
    
    var audioRecorder : AVAudioRecorder!
    var isRecordMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        selectAudioFile()
        if !isRecordMode{
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        }else{
            initRecord()
        }
    }
    
    func selectAudioFile(){
        if !isRecordMode{
            audioFile = Bundle.main.url(forResource: "Kokain_initio", withExtension: "mp3")
        } else{
            let documentDirectroy = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectroy.appendingPathComponent("recordFile.m4a")
        }
    }
    
    func initPlay(){
        do{
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        }catch let error as NSError{
            print("Error-initPlay : \(error)")
        }
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        lblRecord.textColor = UIColor.gray
    }
    
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey:NSNumber(value: kAudioFormatAppleLossless as UInt32),AVEncoderAudioQualityKey:AVAudioQuality.max.rawValue,AVEncoderBitRateKey:320000,AVNumberOfChannelsKey:2,AVSampleRateKey:44100.0] as [String : Any]
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        }catch let error as NSError{
            print("Error-initRecord : \(error)")
        }
        audioRecorder.delegate = self
        lblRecord.textColor = UIColor.black
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertNSTimeInterval2String(0)
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(false, pause: false, stop: false)
        let session = AVAudioSession.sharedInstance()
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError{
            print("Error-setCategory : \(error)")
        }
        
        do{
            try session.setActive(true)
        }catch let error as NSError{
            print("Error-setActive : \(error)")
        }
        
    }
    
    func setPlayButtons(_ play:Bool, pause:Bool, stop: Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    func convertNSTimeInterval2String(_ time:TimeInterval)->String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d",min,sec)
        return strTime
    }
    
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        imgView.image = playImg
    }
    
    @objc func updatePlayTime(){
        lblCurrentTime.text = convertNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    @objc func updateRecordTime(){
        lblRecordTime.text = convertNSTimeInterval2String(audioRecorder.currentTime)
    }
    
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()
        setPlayButtons(true, pause: false, stop: true)
        imgView.image = pauseImg
    }
    
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertNSTimeInterval2String(0)
        setPlayButtons(true, pause: false, stop: false)
        progressTimer.invalidate()
        imgView.image = stopImg
    }
    
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(true, pause: false, stop: false)
    }
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime=0
            lblRecordTime!.text = convertNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
            imgView.image = stopImg
        }else{
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertNSTimeInterval2String(0)
        }
        selectAudioFile()
        if !isRecordMode{
            initPlay()
        }else{
            initRecord()
        }
    }
    @IBAction func btnRecord(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Record"{
            audioRecorder.record()
            (sender as AnyObject).setTitle("Stop", for: UIControl.State())
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
            imgView.image = recordImg
        }else{
            audioRecorder.stop()
            progressTimer.invalidate()
            (sender as AnyObject).setTitle("Record", for: UIControl.State())
            btnPlay.isEnabled=true
            initPlay()
            imgView.image = stopImg
        }
    }
    

}

