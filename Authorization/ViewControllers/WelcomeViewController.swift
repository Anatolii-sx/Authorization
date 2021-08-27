//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Анатолий Миронов on 23.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    var name: String!
    var surname: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let name = name,
              let surname = surname
        else { return }
        
        welcomeLabel.text = "Welcome, \(name) \(surname)"
    }
}
