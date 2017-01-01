//
//  TDTextSlider.swift
//  TDTextSlider
//
//  Created by Emre Duman on 01/01/17.
//  Copyright © 2017 theduman. All rights reserved.
//

import Foundation
import UIKit

class TDTextSlider: UIView {

    var currentLabel: UILabel = UILabel()
    var nextLabel: UILabel = UILabel()
    var textArray: [String] = [String]()
    var duration: Double = Double()
    var delay: Double = Double()
    var viewBounds: CGRect = CGRect()
    var direction: String = String()

    private var counter = 2

    override init (frame : CGRect) {
        super.init(frame : frame)
    }
    func createSlider(textArray: [String] ,duration: Double , delay: Double , direction: String = "ltr") {
        self.viewBounds = bounds
        self.textArray = textArray
        self.duration = duration
        self.delay = delay
        self.direction = direction
        self.backgroundColor = .red
        self.currentLabel = currentLabelDesign(label: self.currentLabel)
        self.nextLabel = nextLabelDesign(label: self.nextLabel)
        self.clipsToBounds = true
        self.addSubview(nextLabel)
        self.addSubview(currentLabel)
    }
    private func currentLabelDesign(label: UILabel) -> UILabel {
        if textArray.count == 0 {
            label.text = ""
        }else{
            label.text = textArray[0]
        }
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        label.frame = CGRect(x:0,y: 0 , width: self.viewBounds.width , height: self.viewBounds.height)
        return label
    }
    private func nextLabelDesign(label: UILabel) -> UILabel {
        switch direction {
        case "ltr":
            label.frame = CGRect(x: -self.viewBounds.width ,y: 0 , width: self.viewBounds.width , height: self.viewBounds.height)
        case "rtl":
            label.frame = CGRect(x: self.viewBounds.width ,y: 0 , width: self.viewBounds.width , height: self.viewBounds.height)
        case "ttb":
            label.frame = CGRect(x: 0 ,y: -self.viewBounds.height , width: self.viewBounds.width , height: self.viewBounds.height)
        case "btt":
            label.frame = CGRect(x: 0 ,y: self.viewBounds.height , width: self.viewBounds.width , height: self.viewBounds.height)
        default:
            label.frame = CGRect(x: -self.viewBounds.width ,y: 0 , width: self.viewBounds.width , height: self.viewBounds.height)
        }
        if textArray.count == 0 {
            label.text = ""
        }else if textArray.count == 1{
            label.text = textArray[0]
        }else{
            label.text = textArray[1]
        }
        label.textAlignment = .center
        label.textColor = .white
        label.adjustsFontSizeToFitWidth = true
        return label
    }
    func startAnimating() {
        if self.textArray.count > 0 {
            UIView.animate(withDuration: duration, animations: {
                switch self.direction {
                case "ltr":
                    self.nextLabel.layer.position.x += self.viewBounds.width
                    self.currentLabel.layer.position.x += self.viewBounds.width
                case "rtl":
                    self.nextLabel.layer.position.x -= self.viewBounds.width
                    self.currentLabel.layer.position.x -= self.viewBounds.width
                case "ttb":
                    self.nextLabel.layer.position.y += self.viewBounds.height
                    self.currentLabel.layer.position.y += self.viewBounds.height
                case "btt":
                    self.nextLabel.layer.position.y -= self.viewBounds.height
                    self.currentLabel.layer.position.y -= self.viewBounds.height
                default:
                    self.nextLabel.layer.position.x += self.viewBounds.width
                    self.currentLabel.layer.position.x += self.viewBounds.width
                }
            },completion: { (true) ->Void in
                self.currentLabel.text = self.nextLabel.text
                self.currentLabel.frame = self.nextLabel.frame
                switch self.direction {
                case "ltr":
                    self.nextLabel.frame = CGRect(x: -self.viewBounds.width, y : 0 , width: self.viewBounds.width , height:self.viewBounds.height)
                case "rtl":
                    self.nextLabel.frame = CGRect(x: self.viewBounds.width, y : 0 , width: self.viewBounds.width , height:self.viewBounds.height)
                case "ttb":
                    self.nextLabel.frame = CGRect(x: 0, y : -self.viewBounds.height , width: self.viewBounds.width , height:self.viewBounds.height)
                case "btt":
                    self.nextLabel.frame = CGRect(x: 0, y : self.viewBounds.height , width: self.viewBounds.width , height:self.viewBounds.height)
                default:
                    self.nextLabel.frame = CGRect(x: -self.viewBounds.width, y : 0 , width: self.viewBounds.width , height:self.viewBounds.height)
                }

                if self.counter == self.textArray.count{
                    self.counter = 0
                }
                if self.textArray.count < 2 {
                    self.nextLabel.text = self.textArray[0]
                }else{
                    self.nextLabel.text = self.textArray[self.counter]
                }
                self.counter += 1

                DispatchQueue.main.asyncAfter(deadline: .now() + self.delay) {
                    self.startAnimating()
                }
            })
        }
    }

    convenience init () {
        self.init(frame:CGRect.zero)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("This class does not support NSCoding")
    }
}
