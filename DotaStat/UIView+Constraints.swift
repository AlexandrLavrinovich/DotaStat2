//
//  UIView+Constraints.swift
//  DotaStat
//
//  Created by MacBook Pro on 11.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import SnapKit

extension UIView {
    func pinEdgesToSuperView() {
        guard let superView = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        superview?.backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.06274509804, blue: 0.2392156863, alpha: 1)
        snp.makeConstraints{(make) in
//            make.topMargin.left.equalTo(10)
//            make.bottomMargin.right.equalTo(10)
            
            make.centerXWithinMargins.equalToSuperview()
            make.centerYWithinMargins.equalToSuperview()
            make.bottomMargin.equalTo(-100)
        }
        
//        topAnchor.constraint(equalTo: superView.topAnchor, constant: 230).isActive = true
//        leftAnchor.constraint(equalTo: superView.leftAnchor).isActive = true
//        bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -230).isActive = true
//        rightAnchor.constraint(equalTo: superView.rightAnchor).isActive = true
    }
}
