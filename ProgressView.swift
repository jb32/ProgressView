//
//  ProgressView.swift
//  NoWorry
//
//  Created by 薛 靖博 on 2018/8/30.
//  Copyright © 2018年 FT. All rights reserved.
//

import UIKit

class ProgressView: UIView {
    
    var value: CGFloat = 0.5 {
        didSet {
            valueAfterLB.string = "\(value * 100)%"
            valueFrontLB.string = "\(value * 100)%"
            valueWidth = frame.width * value
        }
    }
    var color = UIColor.blue
    var textColor = UIColor.red
    var fontSize: CGFloat = 14
    
    fileprivate var valueWidth: CGFloat = 0
    fileprivate let progressLayer = CALayer()
    fileprivate let valueAfterLB = CATextLayer()
    fileprivate let valueFrontLB = CATextLayer()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        valueAfterLB.foregroundColor = textColor.cgColor
        valueAfterLB.fontSize = fontSize
        valueAfterLB.contentsScale = UIScreen.main.scale
        valueAfterLB.string = "50%"
        valueAfterLB.zPosition = 0
        layer.addSublayer(valueAfterLB)
        
        progressLayer.backgroundColor = color.cgColor
        progressLayer.zPosition = 1
        layer.addSublayer(progressLayer)
        
        valueFrontLB.foregroundColor = UIColor.white.cgColor
        valueFrontLB.fontSize = fontSize
        valueFrontLB.contentsScale = UIScreen.main.scale
        valueFrontLB.string = "50%"
        valueFrontLB.zPosition = 0
        progressLayer.addSublayer(valueFrontLB)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        valueWidth = frame.width * value
        progressLayer.frame = CGRect(x: 0, y: 0, width: valueWidth, height: frame.height)
        
        let position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        valueAfterLB.bounds = CGRect(x: 0, y: 0, width: 40, height: 20)
        valueAfterLB.alignmentMode = kCAAlignmentCenter
        valueAfterLB.position = position
        
        valueFrontLB.bounds = CGRect(x: 0, y: 0, width: 40, height: 20)
        valueFrontLB.position = layer.convert(position, to: progressLayer)
    }
}
