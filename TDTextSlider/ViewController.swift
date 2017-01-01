//
//  ViewController.swift
//  TDTextSlider
//
//  Created by Emre Duman on 01/01/17.
//  Copyright © 2017 theduman. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let ts = TDTextSlider(frame: CGRect(x:0,y:200,width: UIScreen.main.bounds.width,height: 100))

    override func viewDidLoad() {
        super.viewDidLoad()

        ts.createSlider(textArray: ["Emre","Duman","Github","TheDuman"], duration: 3.0, delay: 2.0)
        ts.backgroundColor = .green
        self.view.addSubview(ts)
    }
    override func viewDidAppear(_ animated: Bool) {
        ts.startAnimating()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

