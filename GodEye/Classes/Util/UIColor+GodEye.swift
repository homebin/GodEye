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
}
