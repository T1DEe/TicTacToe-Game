//
//  FieldButton.swift
//  TicTacToe
//
//  Created by Artemy Markovsky on 6/1/19.
//  Copyright © 2019 ArtemyMarkovsky. All rights reserved.
//

import UIKit

class FieldButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setImage(UIImage(named: "unmarked"), for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
