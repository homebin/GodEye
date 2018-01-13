//
//  UIAlertView+GodEye.swift
//  GodEye
//
//  Created by 林鸿彬 on 2018/1/13.
//  Copyright © 2018年 zixun. All rights reserved.
//

import Foundation

private var key = "kUIAlertViewHandler"
extension UIAlertView {
    
    
    private var handler:UIAlertViewHandler?{
        set{
            objc_setAssociatedObject(self, &key, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        get{
            return objc_getAssociatedObject(self, &key) as! UIAlertViewHandler?
        }
    }
    
    
    
    public class func quickTip(message: String,
                               title: String = "Tip",
                               cancelButtonTitle: String = "OK") {
        UIAlertView(title: title, message: message, delegate: nil, cancelButtonTitle: cancelButtonTitle).show()
    }
    
    public class func quickConfirm(message: String,
                                   title: String,
                                   cancelButtonTitle:String = "No",
                                   confirmButtonTitle:String = "Yes",
                                   clickedButtonAtIndex:@escaping ( _ buttonIndex: Int)->()) {
        
        let alert = UIAlertView(title: title,
                                message: message,
                                delegate: nil,
                                cancelButtonTitle: cancelButtonTitle,
                                otherButtonTitles: confirmButtonTitle)
        
        alert.handler = UIAlertViewHandler { (handler, index) in
            clickedButtonAtIndex(index)
        }
        alert.delegate = alert.handler
        alert.show()
    }
}


private class UIAlertViewHandler: NSObject,UIAlertViewDelegate {
    typealias ClickBlock = (_ handler:UIAlertViewHandler,_ index:Int)->()
    
    private var clickBlock: ClickBlock!
    
    init(clickBlock:@escaping ClickBlock) {
        super.init()
        self.clickBlock = clickBlock
    }
    
    @objc func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        self.clickBlock(self,buttonIndex)
    }
}
