//
//  ViewController.swift
//  Alzheimers
//
//  Created by Sandeep Gupta on 03/11/18.
//  Copyright © 2018 Ayushi Gupta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func Button(_ sender: Any) {
        performSegue(withIdentifier: "FirstSegue", sender: self)
    }
    @IBOutlet weak var label: UILabel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

