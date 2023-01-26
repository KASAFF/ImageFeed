//
//  UIView+Extension.swift
//  ImageFeed
//
//  Created by Aleksey Kosov on 26.01.2023.
//

import UIKit

class GradientView: UIView {
    private var gradientLayer: CAGradientLayer?

    override public func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        guard gradientLayer == nil else {
            gradientLayer?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
            return
        }

        gradientLayer = CAGradientLayer()
        gradientLayer!.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height)
        gradientLayer!.colors = [
            UIColor.black.withAlphaComponent(0.0).cgColor,
            UIColor.black.withAlphaComponent(0.8).cgColor
        ]
        gradientLayer!.locations = [0, 1]
        gradientLayer!.startPoint = CGPoint(x: 0.5, y: 0)
        gradientLayer!.endPoint = CGPoint(x: 0.5, y: 1)
        self.layer.addSublayer(gradientLayer!)
    }
}
