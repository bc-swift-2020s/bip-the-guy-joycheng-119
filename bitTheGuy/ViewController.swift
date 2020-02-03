//
//  ViewController.swift
//  bitTheGuy
//
//  Created by cheng jiayi on 2020/2/1.
//  Copyright © 2020 cheng jiayi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageToPunch: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func animateImage() {
        
        let bounds = self.imageToPunch.bounds
        
        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 10, options: [], animations: {
            self.imageToPunch.bounds = CGRect(x: bounds.origin.x + 60, y: bounds.origin.y + 60, width: bounds.size.width - 60, height: bounds.size.height - 60)
        })
    
    }
    
    @IBAction func libraryPressed(_ sender: UIButton) {
    }
    @IBAction func cameraPressed(_ sender: UIButton) {
    }
    
    @IBAction func imageTapped(_ sender: UITapGestureRecognizer) {
        animateImage()
    }
    
}

