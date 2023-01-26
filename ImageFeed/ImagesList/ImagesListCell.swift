//
//  ImagesListCell.swift
//  ImageFeed
//
//  Created by Aleksey Kosov on 26.01.2023.
//

import UIKit

final class ImagesListCell: UITableViewCell {


    @IBOutlet weak var cellImage: UIImageView!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var dateLabel: UILabel!

    @IBOutlet weak var gradientContainerView: UIView!

    
    static let reuseIdentifier = "ImagesListCell"


}


