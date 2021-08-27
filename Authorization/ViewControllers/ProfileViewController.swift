//
//  ProfileViewController.swift
//  Authorization
//
//  Created by Анатолий Миронов on 27.08.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    var name: String!
    var surname: String!
    var email: String!
    var phoneNumber: String!

    override func viewWillLayoutSubviews() {
        photo.layer.cornerRadius = photo.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let name = name,
              let surname = surname,
              let email = email,
              let phoneNumber = phoneNumber
        else { return }

        nameLabel.text = "Name: \(name)"
        surnameLabel.text = "Surname: \(surname)"
        emailLabel.text = "Email: \(email)"
        phoneNumberLabel.text = "Phone: \(phoneNumber)"
    }

}
