//
//  ViewController.swift
//  calculator
//
//  Created by Swamita on 11/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.systemIndigo.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        // to insert layer at bottom so that it doesnt hide labels on top
    }


}

