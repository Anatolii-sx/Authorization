//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Анатолий Миронов on 23.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        welcomeLabel.text = "Welcome, \(user.person.name) \(user.person.surname)"
    }
}
