//
//  BaseRecordViewModel.swift
//  Pods
//
//  Created by zixun on 16/12/29.
//
//

import Foundation

class BaseRecordViewModel: NSObject {
    
    private(set) var attributes = [NSForegroundColorAttributeName: UIColor.white,
                                   NSFontAttributeName:UIFont.courier(with: 12)]
    
    func contentString(with prefex:String?,content:String?,newline:Bool = false,color:UIColor = UIColor(hex: 0x3D82C7)) -> NSAttributedString {
        let pre = prefex != nil ? "[\(prefex!)]:" : ""
        let line = newline == true ? "\n" : (pre == "" ? "" : " ")
        let str = "\(pre)\(line)\(content ?? "nil")\n"
        let result = NSMutableAttributedString(string: str, attributes: self.attributes)
        let range = str.range(of: pre)
        if range != nil {
            result.addAttribute(NSForegroundColorAttributeName, value: color, range: range)
        }
        return result
    }
    
    func headerString(with prefex:String,content:String? = nil,color:UIColor) -> NSAttributedString {
        let header = "> \(prefex): \(content ?? "")\n"
        let result = NSMutableAttributedString(string: header, attributes: self.attributes)
        
        let range = header.range(of: prefex)
        if range?.lowerBound + range.length <= header.length {
            result.addAttributes([NSForegroundColorAttributeName: color], range: range)
        }
        return result
    }
}
