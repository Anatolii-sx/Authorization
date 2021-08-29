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
    
    var user: User!

    override func viewWillLayoutSubviews() {
        photo.layer.cornerRadius = photo.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let user = user else { return }
        
        let profileVC = ProfileViewController()
        profileVC.title = user.person.name + " " + user.person.surname

        nameLabel.text = "Name: \(user.person.name)"
        surnameLabel.text = "Surname: \(user.person.surname)"
        emailLabel.text = "Email: \(user.person.email)"
        phoneNumberLabel.text = "Phone: \(user.person.phoneNumber)"
    }

}
