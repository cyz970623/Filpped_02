//
//  Part3ViewController.swift
//  AudioLabSwift
//
//  Created by yinze cui on 2021/9/16.
//  Copyright © 2021 Eric Larson. All rights reserved.
//

import UIKit
import Metal

class Part3ViewController: UIViewController {
    
    let audio = AudioModel(buffer_size: AUDIO_BUFFER_SIZE/2)
    lazy var graph:MetalGraph? = {
        return MetalGraph(mainView: self.view)
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audio.currrntViewPart = 0
//        self.audio.fftData = []
//        self.audio.timeData = []
//        self.audio.part2MaxFftData = []
        
        
//梁爽添加
        graph?.addGraph(withName: "fft",
                        shouldNormalize: true,
                        numPointsInGraph: AUDIO_BUFFER_SIZE/2)
//        graph?.addGraph(withName: "fft_20",
//                        shouldNormalize: true,
//                        numPointsInGraph: 20)//AUDIO_BUFFER_SIZE/2
        graph?.addGraph(withName: "fft_Max_20",
                        shouldNormalize: true,
                        numPointsInGraph: 20)//AUDIO_BUFFER_SIZE/2
//        graph?.addGraph(withName: "time",
//            shouldNormalize: false,
//            numPointsInGraph: AUDIO_BUFFER_SIZE)
//
        
        
        
        
//        audio.startMicrophoneProcessing(withFps: 10)
//        startAudioLocalProcessing
        audio.startAudioLocalProcessing(withFps: 10)
        audio.startProcesingAudioFileForPlayback()
        audio.play()
        
        
        
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: 0.05, target: self,
            selector: #selector(self.updateGraph),
            userInfo: nil,
            repeats: true)
        
        
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        audio.shouldPause = false
//        audio.currrntViewPart = 1
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @objc
    func updateGraph(){
//        self.graph?.updateGraph(
//            data: self.audio.fftData,
//            forKey: "fft"
//        )
//
//        let zoomedTo20Array:[Float] = Array.init(self.audio.fftData)
//        var tempZoomedArray:[Float] = []
////let tempZoomedArray:[Float] = Array.init(self.audio.fftData[400...2027])
//
//        for (index, value)
//              in zoomedTo20Array.enumerated() {
//                if index % (102) == 0{
//                    if index < 2008{
//                        tempZoomedArray.append(value)
//                    }
////                    tempZoomedArray.append(value*10000)
//            }
//        }
////        print(tempZoomedArray.count)
////        let zoomedTo20Array:[Float] = Array.init(self.audio.fftData)
//        self.graph?.updateGraph(
//            data: zoomedTo20Array,
////            data: tempZoomedArray,
//
//            forKey: "fft_20"
//        )
////
//        self.graph?.updateGraph(
//            data: self.audio.timeData,
//            forKey: "time"
//        )
//
        self.graph?.updateGraph(
            data: self.audio.part2MaxFftData,
            forKey: "fft_Max_20"
        )
        
//
    }

}
