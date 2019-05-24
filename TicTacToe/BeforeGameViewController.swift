//
//  BeforeGameViewController.swift
//  TicTacToe
//
//  Created by Artemy Markovsky on 5/23/19.
//  Copyright © 2019 ArtemyMarkovsky. All rights reserved.
//

import UIKit

class BeforeGameViewController: UIViewController {

    @IBOutlet private weak var fieldSizeTextField: UITextField!
    
    var sizeToSegue: Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func playButtonAction(_ sender: UIButton) {
        sizeToSegue = Int(fieldSizeTextField.text!)
        if sizeToSegue == nil {
            sizeToSegue = 3
            performSegue(withIdentifier: "toGame", sender: nil)
        } else if sizeToSegue! < 3 || sizeToSegue! > 9 {
            return
        } else {
            performSegue(withIdentifier: "toGame", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let dvc = segue.destination as! GameViewController
        dvc.fieldSizeFromSegue = sizeToSegue!
    }
}
