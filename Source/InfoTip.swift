//
//  InfoTip.swift
//  Gerse
//
//  Created by lei on 2020/1/10.
//  Copyright © 2020 lei. All rights reserved.
//

import Foundation
import UIKit

func toolTipPostion(for rect:CGRect) -> (CGPoint, Bool) {
    return (CGPoint(x: rect.minX + rect.width / 2, y: rect.minY < 80 ? rect.maxY : rect.minY ), rect.minY >= 80)
}


class InfoTip: UIView {
    
    init( anchorPoint:CGPoint, text:String, above:Bool = true) {
        super.init(frame: CGRect())
        
        self.backgroundColor = UIColor(displayP3Red: 0.027, green: 0.027, blue: 0.027, alpha: 1)
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 6
        
        let label =  UILabel()
        label.text = text
        label.preferredMaxLayoutWidth = 400
        label.sizeToFit()
        
        label.textColor = UIColor(displayP3Red: 0.96, green: 0.96, blue: 0.96, alpha: 1)
        self.addSubview(label)
        label.frame = CGRect(x: 8, y: 8, width: min(label.frame.size.width, UIScreen.main.bounds.width - 36 )  , height: label.frame.size.height)
        
        let width = min(max(label.frame.width + 16 , 40) , UIScreen.main.bounds.width - 20)
        
        
        self.frame = CGRect(x: min(max(anchorPoint.x - width / 2, 8), UIScreen.main.bounds.width - width - 8)  ,
                            y: above ? anchorPoint.y - 36 : anchorPoint.y ,
                            width: width,
                            height: 36)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewSetup(anchorPoint:CGPoint) {
        
    }
    
}

class InfoTipController: NSObject {
    static let share = InfoTipController()
    weak var infoTip : InfoTip? = nil
    func show(in view:UIView, _ text: String, rect:CGRect ) {
        
        if let iT = self.infoTip {
            iT.removeFromSuperview()
        }
        
        let location = toolTipPostion(for: rect)
        
        
        let infoTip = InfoTip(anchorPoint: location.0, text: text,above: location.1 )
            //InfoTip(coder: CGRect(origin: CGPoint(x: 30, y: 80), size: CGSize(width: 200, height: 80)))
//        infoTip.backgroundColor = UIColor.red
        self.infoTip = infoTip
        view.addSubview(infoTip)
    }
    
    func clear() {
        if let iT = self.infoTip {
            iT.removeFromSuperview()
        }
    }
}
