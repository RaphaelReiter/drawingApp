//
//  ViewController.swift
//  drawing app
//
//  Created by Raphaël Reiter on 26/06/2017.
//  Copyright © 2017 Raphaël Reiter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var lastPoint = CGPoint.zero
    var swiped = false
    
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = false
        
        if let touch = touches.first as UITouch! {
            
            lastPoint = touch.location(in: self.view)
            
        }
    }
    
    func drawLine(_ fromPoint: CGPoint, toPoint: CGPoint) {
        
        UIGraphicsBeginImageContext(view.frame.size)
        
        let context = UIGraphicsGetCurrentContext()
        imageView.image?.draw(in: CGRect(x: 0, y: 0, width: view.frame.size.width , height: view.frame.size.height))
        
        context?.move(to: CGPoint(x: fromPoint.x, y: fromPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(5)
        context?.setStrokeColor(red: red, green: green, blue: blue, alpha: 1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        context?.strokePath()
        
        imageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        swiped = true
        
        if let touch = touches.first as UITouch! {
            
            let currentPoint = touch.location(in: view)
            drawLine(lastPoint, toPoint: currentPoint)
            
            lastPoint = currentPoint
        }
    }
    
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if !swiped {
            
            drawLine(lastPoint, toPoint: lastPoint)
        }
        
        
    }
    
    
    
    @IBAction func reset(_ sender: Any) {
        
        imageView.image = nil
    }
    
    
    @IBAction func seyyings(_ sender: Any) {
    }
    
    @IBAction func save(_ sender: Any) {
    }
    
    
    
    // colours
    
    
    
    @IBAction func red(_ sender: Any) {
        
        (red, green, blue) = (0, 0, 0)
    }
    
    
    @IBAction func green(_ sender: Any) {
        
        (red, green, blue) = (0, 255, 0)
    }
    
    
    @IBAction func blue(_ sender: Any) {
        
        (red, green, blue) = (0, 0, 255)
    }
    

    @IBAction func yellow(_ sender: Any) {
        
        (red, green, blue) = (255, 255, 0)
    }
    
    
    @IBAction func pink(_ sender: Any) {
        
        (red, green, blue) = (255, 0, 255)
    }
    
    
    @IBAction func teal(_ sender: Any) {
        
        (red, green, blue) = (0, 255, 255)
    }
    
    
    @IBAction func white(_ sender: Any) {
        
        (red, green, blue) = (255, 255, 255)
    }
    
    @IBAction func black(_ sender: Any) {
        
        (red, green, blue) = (0, 0, 0)
    }
    
    
    
}

