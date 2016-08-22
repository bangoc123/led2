//
//  ViewController.swift
//  led2
//
//  Created by Ngoc on 8/22/16.
//  Copyright © 2016 GDG. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var tf_input: UITextField!
    
    @IBOutlet weak var imv_displayBalls: UIImageView!
    
    var n = 0
    
    var _margin: CGFloat = 40
    
    var _margin_top: CGFloat = 100
    
    var _margin_bottom: CGFloat = 40
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func action_draw(sender: AnyObject) {
        removeBallsFromView()
        n = Int(tf_input!.text!)!
        drawRowOfBall(n)
    }

    
    func drawRowOfBall(n:Int){
        for indexHang in 0..<n {
            for indexCot in 0..<n {
                let image = UIImage(named: "ball")
                let ball = UIImageView(image: image)
                ball.center = CGPointMake(_margin + CGFloat(indexHang) * spaceBetweenBall(), _margin_top + CGFloat(indexCot) * verticallySpaceBetweenBall())
                imv_displayBalls.addSubview(ball)
            }
            
        }
    }
    
    func removeBallsFromView(){
        for view in imv_displayBalls.subviews{
            view.removeFromSuperview()
        }
    }
    
    func spaceBetweenBall() -> CGFloat {
        let space = (self.view.bounds.size.width - 2*_margin)/CGFloat(n-1)
        return space
    }
    
    func verticallySpaceBetweenBall() -> CGFloat{
        let verticallySpace = (self.view.bounds.size.height - _margin_top - _margin_bottom)/CGFloat(n-1)
        return verticallySpace
    }

}

