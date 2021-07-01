//
//  Round.swift
//  TschenrechnerNeu
//
//  Created by Mario Mohar on 15.01.21.
//

import UIKit
@IBDesignable
class Round: UIButton {

    @IBInspectable var roundButton : Bool = false {
        didSet {
            if roundButton == true {
                layer.cornerRadius = frame.height / 2
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        if roundButton == true {
            layer.cornerRadius = frame.height / 2
        }
    }
}
