//
//  DrawingBoard.swift
//  MyDrawingApp
//
//  Created by Taha Ishfaq on 2019-11-20.
//  Copyright © 2019 Taha Ishfaq. All rights reserved.
//

import UIKit

class DrawingBoard: UIView {
    
    override func draw(_ rect: CGRect) {
    super.draw(rect)
        
    guard let context = UIGraphicsGetCurrentContext() else
    { return }

    context.setStrokeColor(UIColor.black.cgColor)
    context.setLineWidth(CGFloat(strokeWidth))
    context.setLineCap(.round)
        
    lines.forEach { (line) in
    for (i,p) in line.enumerated(){
       if i==0 {
       context.move(to: p)
      } else{context.addLine(to: p)}
        
   }
        
  }
        context.strokePath()
}
    
    var lines = [[CGPoint]]()
    
override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    lines.append([CGPoint]())
    
    }

    func clear(){
        lines.removeAll()
        setNeedsDisplay()
    }
    
    func undo(){
    _ = lines.popLast()
    setNeedsDisplay()
    }
    
//    func share(){
//        let activityVC = UIActivityViewController(activityItems: ["www.google.com"], applicationActivities: nil )
//        activityVC.popoverPresentationController?.sourceView = self.view
//
//        self.present(activityVC, animated: true, completion: nil )
//    }
    
    var strokeWidth: Float = 1
    func setStrokeWidth(width: Float){
     self.strokeWidth = width
    }
    
    
override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    guard let point = touches.first?.location(in: nil) else {return}
    guard var lastLine = lines.popLast() else {return}
    lastLine.append(point)
    lines.append(lastLine)
    setNeedsDisplay()
    

    }
}

