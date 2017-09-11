//
//  DataShow.swift
//  SignUpScreenUsingJson
//
//  Created by appinventiv on 11/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class DataShow: UIViewController {

    // Varibles ****************
    
    var userName: Any!
    var password: Any!
    var confirmPassword: Any!
    var adress: Any!
    var age:Any!
    var designation: Any!
    
    
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var passwordLabel: UILabel!
    
    @IBOutlet weak var confirmPasswordLabel: UILabel!
    
    @IBOutlet weak var adressLabel: UILabel!
    
    @IBOutlet weak var ageLabel: UILabel!

    @IBOutlet weak var designationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = userName as? String
        passwordLabel.text = password as? String
        confirmPasswordLabel.text = confirmPassword as? String
        adressLabel.text = adress as? String
        ageLabel.text = age as? String
        designationLabel.text = designation  as? String
    }
    


}
