//
//  SignUpTableViewCell.swift
//  SignUpScreenUsingJson
//
//  Created by appinventiv on 11/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class SignUpTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    @IBOutlet weak var btnOutlet: UIButton!
    
    
    @IBOutlet weak var signBtnOutlet: UIButton!
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    @IBOutlet weak var adressTextField: UITextField!
    
    @IBOutlet weak var ageTextField: UITextField!

    @IBOutlet weak var designationTextField: UITextField!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
