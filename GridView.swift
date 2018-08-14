//
//  GridView.swift
//  GridView
//
//  Created by 鶴本賢太朗 on 2018/08/14.
//  Copyright © 2018年 Kentarou. All rights reserved.
//

import UIKit

class GridView: UIView {
    
    // 列数
    internal var row: Int = 3 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // 行数
    internal var line: Int = 3 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // 線の色
    internal var drawColor: UIColor = .white {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // 線の太さ
    internal var lineWidth: CGFloat = 1 {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    override func draw(_ rect: CGRect) {
        let path: UIBezierPath = UIBezierPath()
        path.lineWidth = self.lineWidth
        self.drawColor.setStroke()
        
        // 列の線を引く
        do {
            let height: CGFloat = self.frame.height
            let offsetX: CGFloat = self.frame.width / CGFloat(self.row)
            for i in 1 ..< self.row {
                let x: CGFloat = CGFloat(i) * offsetX
                path.move(to: CGPoint(x: x, y: 0))
                path.addLine(to: CGPoint(x: x, y: height))
                path.stroke()
            }
        }
        
        // 行の線を引く
        do {
            let width: CGFloat = self.frame.width
            let offsetY: CGFloat = self.frame.height / CGFloat(self.line)
            for i in 1 ..< self.line {
                let y: CGFloat = CGFloat(i) * offsetY
                path.move(to: CGPoint(x: 0, y: y))
                path.addLine(to: CGPoint(x: width, y: y))
                path.stroke()
            }
        }
    }
}
