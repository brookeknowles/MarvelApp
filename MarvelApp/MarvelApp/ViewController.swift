//
//  ViewController.swift
//  MarvelApp
//
//  Created by Brooke Knowles on 27/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Test"
        label.textColor = .red
        label.font = UIFont(name:"Arial", size: 50)

        self.view.addSubview(label)
    }


}

