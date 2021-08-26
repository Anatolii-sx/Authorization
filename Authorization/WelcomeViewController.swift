//
//  WelcomeViewController.swift
//  Authorization
//
//  Created by Анатолий Миронов on 23.08.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    var userName: String!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let userName = userName else { return }
        welcomeLabel.text = "Hello, \(userName)"
    }
}
