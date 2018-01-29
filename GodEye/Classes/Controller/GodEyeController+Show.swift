//
//  GodEyeController+Show.swift
//  Pods
//
//  Created by zixun on 16/12/27.
//
//

import Foundation

extension GodEyeController {
    
    var animating: Bool {
        get {
            return objc_getAssociatedObject(self, &Define.Key.Associated.Animation) as? Bool ?? false
        }
        
        set {
            objc_setAssociatedObject(self, &Define.Key.Associated.Animation, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var showing: Bool {
        get {
            return objc_getAssociatedObject(self, &Define.Key.Associated.Showing) as? Bool ?? false
        }
        
        set {
            objc_setAssociatedObject(self, &Define.Key.Associated.Showing, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    var window: UIWindow? {
        get{
            return objc_getAssociatedObject(self, &Define.Key.Associated.KeyWindow) as? UIWindow
        }
        set{
            objc_setAssociatedObject(self, &Define.Key.Associated.KeyWindow, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
    
    class func show(window: UIWindow) {
        self.shared.showConsole(window: window)
    }
    
    class func hide(window: UIWindow) {
        self.shared.hideConsole(window: window)
    }
    
    private func hideConsole(window: UIWindow) {
        if self.animating == false && self.view.superview != nil {
            self.window = window
            window.findAndResignFirstResponder()
            
            self.animating = true
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationDelegate(self)
            UIView.setAnimationDidStop(#selector(GodEyeController.consoleHidden))
            self.view.frame = UIScreen.offscreenFrame()
            UIView.commitAnimations()
            
        }
    }
    
    private func showConsole(window: UIWindow) {
        if self.animating == false && self.view.superview == nil {
            self.window = window
            window.findAndResignFirstResponder()
            
            self.view.frame = UIScreen.offscreenFrame()
            self.setViewPlace(window: window)
            
            self.animating = true
            
            
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationDuration(0.4)
            UIView.setAnimationDelegate(self)
            UIView.setAnimationDidStop(#selector(GodEyeController.consoleShown))
            self.view.frame = UIScreen.onscreenFrame()
//            self.view.transform = self.viewTransform()
            UIView.commitAnimations()
        }
    }
    
    @objc private func consoleShown() {
        self.showing = true
        self.animating = false
        UIApplication.shared.mainWindow()?.findAndResignFirstResponder()
    }
    
    @objc private func consoleHidden() {
        self.showing = false
        self.animating = false
        self.view.removeFromSuperview()
    }
    
    private func setViewPlace(window: UIWindow) {
//        guard let superView = UIApplication.shared.mainWindow() else {
//            return
//        }
        self.window = window
        window.addSubview(self.view)
        
        //bring AssistiveButton to front
        for subview in window.subviews {
            if subview.isKind(of: AssistiveButton.classForCoder()) {
                window.bringSubview(toFront: subview)
            }
        }
    }
    
    private func viewTransform() -> CGAffineTransform {
        var angle: Double = 0.0
        switch UIApplication.shared.statusBarOrientation {
        case .portraitUpsideDown:
            angle = M_PI
        case .landscapeLeft:
            angle = -M_PI_2
        case .landscapeRight:
            angle = M_PI_2
        default:
            angle = 0
        }
        
        
        return CGAffineTransform(rotationAngle: CGFloat(angle))
    }
}
