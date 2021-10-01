//
//  ViewController.swift
//  AudioLabSwift
//
//  Created by Eric Larson
//  Copyright © 2020 Eric Larson. All rights reserved.
//

import UIKit
import Metal


var AUDIO_BUFFER_SIZE = 1024*4 //被梁爽注释了


class Part2ViewController: UIViewController {

    
    let audio = AudioModel(buffer_size: AUDIO_BUFFER_SIZE)
    lazy var graph:MetalGraph? = {
        return MetalGraph(mainView: self.view)
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        audio.currrntViewPart = 1
        
        // add in graphs for display
        graph?.addGraph(withName: "fft",
                        shouldNormalize: true,
                        numPointsInGraph: AUDIO_BUFFER_SIZE/4)
// 梁爽添加
        graph?.addGraph(withName: "fft_20",
                        shouldNormalize: true,
                        numPointsInGraph: 20)//AUDIO_BUFFER_SIZE/2
        graph?.addGraph(withName: "fft_Max_20",
                        shouldNormalize: true,
                        numPointsInGraph: 20)//AUDIO_BUFFER_SIZE/2
//
        
        graph?.addGraph(withName: "time",
            shouldNormalize: false,
            numPointsInGraph: AUDIO_BUFFER_SIZE/16)

        // just start up the audio model here
        audio.startMicrophoneProcessing(withFps: 10)
        //audio.startProcesingAudioFileForPlayback()
        audio.startProcessingSinewaveForPlayback(withFreq: 15000.0)
        audio.play()
        
        // run the loop for updating the graph peridocially
        Timer.scheduledTimer(timeInterval: 0.05, target: self,
            selector: #selector(self.updateGraph),
            userInfo: nil,
            repeats: true)
       
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        audio.shouldPause = false
        
        
    }

    
    @objc
    func updateGraph(){
        self.graph?.updateGraph(
            data: self.audio.fftData,
            forKey: "fft"
        )
        
        let zoomedTo20Array:[Float] = Array.init(self.audio.fftData)
        var tempZoomedArray:[Float] = []
//let tempZoomedArray:[Float] = Array.init(self.audio.fftData[400...2027])

        for (index, value)
              in zoomedTo20Array.enumerated() {
                if index % (1) == 0{
                    if index < 2048{
                        tempZoomedArray.append(value)
                    }
//                    tempZoomedArray.append(value*10000)
                }
        }
//        print(tempZoomedArray.count)
//        let zoomedTo20Array:[Float] = Array.init(self.audio.fftData)
        self.graph?.updateGraph(
            data: zoomedTo20Array,
//            data: tempZoomedArray,
            
            forKey: "fft_20"
            )
//
        self.graph?.updateGraph(
            data: self.audio.timeData,
            forKey: "time"
        )
//
        self.graph?.updateGraph(
            data: self.audio.part2MaxFftData,
            forKey: "fft_Max_20"
        )
        
//
    }
    
    

}



