//
//  Part1ViewController.swift
//  AudioLabSwift
//
//  Created by yinze cui on 2021/9/16.
//  Copyright © 2021 Eric Larson. All rights reserved.
//

import UIKit

class Part1ViewController: UIViewController {
    //let audio = AudioModel()
    @IBOutlet weak var pauseMusic: UINavigationItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        //print("appear")
        // Do any additional setup after loading the view.
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        
        //audio.shouldPause = false
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
