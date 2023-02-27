//
//  RandomColours.swift
//  Colours App
//
//  Created by Umar Pirmahomed on 21/02/2023.
//

import UIKit

class RandomColours: UIViewController {
    var colour: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = colour ?? .blue
        // Do any additional setup after loading the view.
    }
    

}
