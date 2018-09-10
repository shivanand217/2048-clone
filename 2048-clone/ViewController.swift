//
//  ViewController.swift
//  2048-clone
//
//  Created by apple on 10/09/18.
//  Copyright © 2018 shiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startGameButtonTapped(_ sender : UIButton) {
        let game = NumberTileGameViewController(dimension: 4, threshold: 2048)
        self.present(game, animated: true, completion: nil)
    }


}

