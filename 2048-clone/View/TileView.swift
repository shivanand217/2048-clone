//
//  TileView.swift
//  2048-clone
//
//  Created by apple on 10/09/18.
//  Copyright © 2018 shiv. All rights reserved.
//

import Foundation
import UIKit

class TileView : UIView {
    var value: Int = 0 {
        didSet {
            
        }
    }

    unowned let delegate: AppearanceProviderProtocol
    let numberLabel: UILabel
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("NSCoding not supported..")
    }
    
    init(position: CGPoint, width: CGFloat, value: Int, radius: CGFloat, delegate d: AppearanceProviderProtocol) {
        delegate = d
        numberLabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: width))
        numberLabel.textAlignment = .center
        numberLabel.minimumScaleFactor = 0.5
        numberLabel.font = delegate.
    }
    
}
