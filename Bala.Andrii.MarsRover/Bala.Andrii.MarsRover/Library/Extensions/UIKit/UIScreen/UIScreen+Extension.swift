//
//  UIScreen+Extension.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import UIKit

extension UIScreen {
    
    class var width: CGFloat {
        var width = UIScreen.main.bounds.size.width
        
        if let window = UIApplication.shared.keyWindow {
            let safeAreaLeft = window.safeAreaInsets.left
            let safeAreaRight = window.safeAreaInsets.right
            width -= safeAreaLeft + safeAreaRight
        }
        return width
    }
}
