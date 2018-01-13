//
//  UIColor+GodEye.swift
//  GodEye
//
//  Created by 林鸿彬 on 2018/1/13.
//  Copyright © 2018年 zixun. All rights reserved.
//

import Foundation

extension UIColor {
    public convenience init(hex:Int, alpha:CGFloat = 1.0) {
        let red: CGFloat = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green: CGFloat = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let blue: CGFloat = CGFloat((hex & 0x0000FF)) / 255.0
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    public class func niceBlack() -> UIColor {
        return UIColor(red: 30.0/255.0, green: 32.0/255.0, blue: 40.0/255.0, alpha: 1)
    }
    
    public class func niceDuckBlack() -> UIColor {
        return UIColor(red: 20.0/255.0, green: 21.0/255.0, blue: 27.0/255.0, alpha: 1)
    }
    
    public class func niceRed() -> UIColor {
        return UIColor(red: 237.0/255.0, green: 66.0/255.0, blue: 82.0/255.0, alpha: 1)
    }
    
    public class func niceJHSRed() -> UIColor {
        return UIColor(red: 235.0/255.0, green: 0.0/255.0, blue: 18.0/255.0, alpha: 1)
    }
}
