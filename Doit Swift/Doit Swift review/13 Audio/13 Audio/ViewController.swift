//
//  ViewController.swift
//  13 Audio
//
//  Created by 이전희 on 2022/05/25.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var audioPlayer: AVAudioPlayer!
    let playlist = ["nerdy love-ph1","boat-죠지","trip-릴러말즈"]
    var audioFile: [URL?] = []
    let MAX_VOLUME: Float = 10.0
    var progressTimer: Timer!
    
    var isPlay: Bool = true
    var num: Int = 0
    
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)
    
    
    @IBOutlet var MusicTitle: UILabel!
    
    @IBOutlet var pvProgressPlay: UIProgressView!
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblEndTime: UILabel!
    

    @IBOutlet var btnBackward: UIButton!
    @IBOutlet var btnPlayPause: UIButton!
    @IBOutlet var btnForward: UIButton!
    
    //    @IBOutlet var btnPlay: UIButton!
    //    @IBOutlet var btnPause: UIButton!
    //    @IBOutlet var btnStop: UIButton!
    
    @IBOutlet var slVolume: UISlider!
    
    @IBOutlet var btnRecord: UIButton!
    @IBOutlet var lblRecordTime: UILabel!
    
    var audioRecorder: AVAudioRecorder!
    var isRecordMode = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        num = 0
        selectAudioFile()
        if !isRecordMode{
            initPlay(num)
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
        } else{
            initRecord()
        }
        
    }
    
    func selectAudioFile(){
        if !isRecordMode{
            for music in playlist {
                audioFile.append(Bundle.main.url(forResource: music, withExtension: "mp3"))
            }
        } else {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = [documentDirectory.appendingPathComponent("recordFile.m4a")]
            num = 0
        }
    }
    
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey: NSNumber(value: kAudioFormatAppleLossless as UInt32),
            AVEncoderAudioQualityKey: AVAudioQuality.max.rawValue,
            AVEncoderBitRateKey: 320000,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey: 44100.0
        ] as [String: Any]
        
        do{
            audioRecorder = try AVAudioRecorder(url: audioFile[0]!, settings: recordSettings)
        }catch let error as NSError{
            print("error-initRecord : \(error)")
        }
        audioRecorder.delegate = self
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = converNSTimeInterval2String(0)
        lblCurrentTime.text = converNSTimeInterval2String(0)
        
        btnForward.isEnabled = false
        btnPlayPause.isEnabled = false
        btnBackward.isEnabled = false
        
        MusicTitle.text = "record"
        
        let session = AVAudioSession.sharedInstance()
        do{
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        }catch let error as NSError{
            print("Error-setCategory: \(error)")
        }
        do{
            try session.setActive(true)
        }catch let error as NSError{
            print("Error-setActive: \(error)")
        }
        
    }
    
    func initPlay(_ n:Int){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile[n]!)
        } catch let error as NSError {
            print("Error-initPlay : \(error)")
        }
        
        MusicTitle.text = playlist[n]
        slVolume.maximumValue = MAX_VOLUME
        slVolume.value = 1.0
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = converNSTimeInterval2String(audioPlayer.duration)
        lblCurrentTime.text = converNSTimeInterval2String(0)
        
        isPlay = false
        
        btnForward.isEnabled = true
        btnPlayPause.isEnabled = true
        btnBackward.isEnabled = true
        //        setPlayButtons(true, pause: false, stop: false)
        
    }
    
    //
    //    func setPlayButtons(_ play: Bool, pause: Bool, stop: Bool){
    //        btnPlay.isEnabled = play
    //        btnPause.isEnabled = pause
    //        btnStop.isEnabled = stop
    //    }
    
    func converNSTimeInterval2String(_ time: TimeInterval)->String{
        let min = Int(time/60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }
    
    @objc func updatePlayTime(){
        lblCurrentTime.text = converNSTimeInterval2String(audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    @objc func updateRecordTime(){
        lblRecordTime.text = converNSTimeInterval2String(audioRecorder.currentTime)
    }
    
    func audioPlay(){
        audioPlayer.play()
        btnPlayPause.setImage(UIImage(systemName: "pause.fill"), for: .normal)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    }
    func audioPause(){
        audioPlayer.pause()
        btnPlayPause.setImage(UIImage(systemName: "play.fill"), for: .normal)
    }
    func audioStop(){
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = converNSTimeInterval2String(0)
    }
    
    func numChange(_ n: Int){
        if num + n >= playlist.count{
            num = 0
        } else if num + n < 0 {
            num = playlist.count - 1
        }else{
            num = num + n
        }
    }
    
    
    
    @IBAction func btnBackward(_ sender: UIButton) {
        if audioPlayer.isPlaying && audioPlayer.currentTime > 3{
            audioStop()
            audioPlay()
        }else{
            numChange(-1)
            initPlay(num)
            audioPlay()
        }
    }
    
    @IBAction func btnPlayPauseAudio(_ sender: UIButton) {
        if !audioPlayer.isPlaying {
            audioPlay()
        } else {
            audioPause()
        }
    }
    
    @IBAction func btnForward(_ sender: UIButton) {
        numChange(1)
        initPlay(num)
        audioPlay()
    }
    
    
    //    @IBAction func btnPalyAudio(_ sender: UIButton) {
    //        audioPlayer.play()
    //        setPlayButtons(false, pause: true, stop: true)
    //        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
    //    }
    //
    //    @IBAction func btnPauseAudio(_ sender: UIButton) {
    //        audioPlayer.pause()
    //        setPlayButtons(true, pause: false, stop: true)
    //    }
    //
    //    @IBAction func btnStopAudio(_ sender: UIButton) {
    //        audioPlayer.stop()
    //        audioPlayer.currentTime = 0
    //        lblCurrentTime.text = converNSTimeInterval2String(0)
    //
    //        setPlayButtons(true, pause: false, stop: false)
    //
    //        progressTimer.invalidate()
    //    }
    //
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        //        setPlayButtons(true, pause: false, stop: false)
    }
    
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn{
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblRecordTime!.text = converNSTimeInterval2String(0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime.isEnabled = true
        }else{
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = converNSTimeInterval2String(0)
        }
        
        selectAudioFile()
        
        if !isRecordMode{
            initPlay(num)
        }else{
            initRecord()
        }
    }
    
    @IBAction func btnReord(_ sender: UIButton) {
        if (sender as AnyObject).titleLabel?.text == "Off"{
            audioRecorder.record()
            (sender as AnyObject).setTitle("On", for: .normal)
            (sender as AnyObject).setImage(UIImage(systemName: "square.fill"), for: .normal)
            (sender as AnyObject).setTitleColor(.systemPink, for: .normal)
            progressTimer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
            
        }else{
            audioRecorder.stop()
            (sender as AnyObject).setTitle("Off", for: .normal)
            (sender as AnyObject).setImage(UIImage(systemName: "circle"), for: .normal)

            (sender as AnyObject).setTitleColor(.systemGray, for: .normal)
            btnPlayPause.isEnabled = true
            initPlay(0)
        }
    }
    
    
}

