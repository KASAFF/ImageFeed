//
//  ProfileViewController.swift
//  ImageFeed
//
//  Created by Aleksey Kosov on 06.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileImageView: UIImageView!

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var tagLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2

    }
    
    @IBAction func logoutButtonTapped(_ sender: Any) {

    }
    


}
