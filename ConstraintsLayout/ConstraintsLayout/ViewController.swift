//
//  ViewController.swift
//  ConstraintsLayout
//
//  Created by Joisse Matos on 04/06/2021.
//

import UIKit
import Cartography

class ViewController: UIViewController {
    
    private let myView: UIView = {
        let myView = UIView()
        return myView
    }()
    
    let button1: UIButton = {
        let button = UIButton()
        button.backgroundColor = .blue
        button.setTitle("Button 1", for: .normal)
        return button
    }()

    let text1: UILabel = {
       let label = UILabel()
        label.text = "First Title"
        label.textAlignment = .center
        label.textColor = UIColor.black
        return label
    }()

    let text2: UILabel = {
       let label = UILabel()
        label.text = "Subtitle"
        label.font = .monospacedSystemFont(ofSize: 10, weight: .regular)
        label.textColor = .cyan
        return label
    }()
    
    let button2: UIButton = {
        let button = UIButton()
        button.backgroundColor = .lightGray
        button.setTitle("Button 2", for: .normal)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.myView)
        self.myView.addSubview(self.text1)
        self.myView.addSubview(self.button1)
        self.myView.addSubview(self.text2)
        self.myView.addSubview(self.button2)
        
        constrain(self.myView, self.text1, self.button1, self.text2, self.button2) {
            myView, text1, button1, text2, button2 in

            text1.top == myView.superview!.topMargin + 50
            text1.left == myView.superview!.leftMargin + 30
            button1.top == text1.topMargin + 30
            button1.left == myView.superview!.leftMargin + 30
            button1.height == text1.height
            button1.width == text1.width
            
            
            text2.top == button1.topMargin + 50
            text2.left == myView.superview!.leftMargin + 30
            button2.top == text2.topMargin + 30
            button2.left == myView.superview!.leftMargin + 30
            button2.height == text2.height
            button2.width == text2.width

        }
    }
}

