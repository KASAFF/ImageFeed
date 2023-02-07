//
//  UIImage+Extension.swift
//  ImageFeed
//
//  Created by Aleksey Kosov on 06.02.2023.
//

import UIKit

extension UIImage {
  func resized(to size: CGSize) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
    draw(in: CGRect(origin: .zero, size: size))
    let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return resizedImage!
  }
}
