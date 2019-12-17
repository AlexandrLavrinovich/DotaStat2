//
//  LogoAnimationView.swift
//  DotaStat
//
//  Created by MacBook Pro on 11.12.2019.
//  Copyright © 2019 MacBook Pro. All rights reserved.
//

import UIKit
import SwiftyGif
import SnapKit

class LogoAnimationView: UIView {

    
    let logoGifImageView: UIImageView = {
        guard let gifImage = try? UIImage(gifName: "ezgif.com-crop") else {
            return UIImageView()
        }
        return UIImageView(gifImage: gifImage, loopCount: 4)
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
//        backgroundColor = UIColor(white: 246.0 / 255.0, alpha: 1)
        backgroundColor = #colorLiteral(red: 0.1568627451, green: 0.06274509804, blue: 0.2392156863, alpha: 1)
        addSubview(logoGifImageView)
        logoGifImageView.translatesAutoresizingMaskIntoConstraints = false
        logoGifImageView.snp.makeConstraints{ (make) in
            make.topMargin.rightMargin.equalTo(20)
            make.bottomMargin.leftMargin.equalTo(-20)
        }
        
//        logoGifImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//        logoGifImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        logoGifImageView.widthAnchor.constraint(equalToConstant: 280).isActive = true
//        logoGifImageView.heightAnchor.constraint(equalToConstant: 108).isActive = true
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
