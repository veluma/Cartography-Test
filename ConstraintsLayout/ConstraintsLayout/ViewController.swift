//
//  ViewController.swift
//  ConstraintsLayout
//
//  Created by Joisse Matos on 04/06/2021.
//

import UIKit
import Cartography

class ViewController: UIViewController {
    //stackview task
    private let stack: UIStackView = {
        let myView = UIStackView()
        myView.alignment = .center
        myView.distribution = .equalCentering
        myView.axis = .horizontal
        myView.spacing = 2
        return myView
    }()
    
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
        label.textAlignment = .center
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
        //unless myView is a required container for another purpose
        // myview is not required. we will keep it for demonstration
        self.view.addSubview(self.stack)
        self.stack.addArrangedSubview(text1)
        self.stack.addArrangedSubview(button1)
        self.stack.addArrangedSubview(text2)
        self.stack.addArrangedSubview(button2)
        //        self.myView.addSubview(self.text1)
        //        self.myView.addSubview(self.button1)
        //        self.myView.addSubview(self.text2)
        //        self.myView.addSubview(self.button2)
        //        self.viewTwo.addSubview(self.text1)
        //        self.viewTwo.addSubview(self.button1)
        //        self.viewTwo.addSubview(self.text2)
        //        self.viewTwo.addSubview(self.button2)
        
        constrain(self.stack) { stack in
            guard let sv = stack.superview else { return }
            stack.top == sv.safeAreaLayoutGuide.top
            stack.leading == sv.safeAreaLayoutGuide.leading + 30
            stack.trailing == sv.safeAreaLayoutGuide.trailing - 30
            stack.bottom == sv.safeAreaLayoutGuide.bottom
        }
        constrain(self.myView) { myView in
            guard let sv =  myView.superview else { return  }
            // attaches our view corners to the corners of the parent view
            myView.leading == sv.leading
            myView.trailing == sv.trailing
        }
        
        //        constrain(self.text1, self.button1, self.text2, self.button2) {  text1, button1, text2, button2 in
        // this is called forcedunwrap and its not null safe
        // text1.top == myView.superview!.topMargin + 50
        
        // safe unwrap the superview to avoid crash or leaks
        // by calling the supperview in a safe manner  we make sure
        // our view has a parrent
        //            guard let sv =  text1.superview else { return }
        // top and bottom of a screen view shoudl be always a Safe Area Layut reference
        // as the phones from 8+ onwars dont have buttons, this saves the spaces for the digital button in iphoneX +
        //            text1.top == sv.safeAreaLayoutGuide.top + 50
        // left is deprecated you should always use Leading(left) and Trailling (right)
        // text1.left == sv.leftMargin + 30
        
        //            text1.leading == sv.leading + 15
        //            text1.trailing == sv.trailing - 15
        
        // this is seeting the width based in constratintss (leading/trailing)
        // and assigning a hard value for the height(52 is what the humancrap of apple indicates a button should height)
        //            button1.width == 52
        //            button1.top == text1.bottom + 30
        //            button1.leading == sv.leading + 30
        //            button1.trailing == sv.trailing - 30
        
        // notice the top of the following element is the bottom of the one above.
        //            text2.top == button1.bottom + 50
        //            text2.leading == sv.leading + 15
        //            text2.trailing == sv.trailing - 15
        
        // this is seeting the width based in constratintss (leading/trailing)
        // and assigning a hard value for the height(52 is what the humancrap of apple indicates a button should height)
        //            button2.width == 52
        //            button2.top == text2.bottom + 30
        //            button2.leading == sv.leading + 30
        //            button2.trailing == sv.trailing - 30
        //        }
    }
}

