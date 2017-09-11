//
//  ViewController.swift
//  SignUpScreenUsingJson
//
//  Created by appinventiv on 11/09/17.
//  Copyright © 2017 appinventiv. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables Declaration............
    
    var userName:String = ""
    var password:String = ""
    var confirmPassword:String = ""
    var adress:String = ""
    var age:String = ""
    var designation:String = ""
    var dictData = [String: Any]()
let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
    
    
    @IBOutlet weak var SignUpTableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myActivityIndicator.center = view.center
        myActivityIndicator.isHidden = true
        view.addSubview(myActivityIndicator)
        let nibCell = UINib(nibName: "SignUpTableViewCell", bundle: nil)
        SignUpTableViewOutlet.register(nibCell, forCellReuseIdentifier: "SignUpTableViewCellId")
        
        
        SignUpTableViewOutlet.delegate = self
        SignUpTableViewOutlet.dataSource = self
        
        // make Custom Celll
        
      
        
    }
    
    
    func getCell(_ button: UIButton) -> UITableViewCell{
        var cell : UIView = button
        while !(cell is SignUpTableViewCell) {
            if let super_view = cell.superview {
                cell = super_view
            }else{}
        }
        guard let tableCell = cell as? SignUpTableViewCell else {fatalError()}
        return tableCell
    }
    

  ///// Function to Fetch Data...........
    
    func fetchDataFromAPI() {
        myActivityIndicator.color = UIColor.red
        myActivityIndicator.startAnimating()
        let headers = [
            "Details": "Person",
            "content-type": "application/x-www-form-urlencoded",
            "cache-control": "no-cache",
            "postman-token": "508fe40f-4a35-2364-bf9b-c4dd19942f11"
        ]
        
      
        let postData = NSMutableData(data: "UserName=\(userName)".data(using: String.Encoding.utf8)!)
        postData.append("&Password=\(password)".data(using: String.Encoding.utf8)!)
        postData.append("&ConfirmPassword=\(confirmPassword)".data(using: String.Encoding.utf8)!)
        postData.append("&Adress=\(adress)".data(using: String.Encoding.utf8)!)
        postData.append("&Age=\(age)".data(using: String.Encoding.utf8)!)
        postData.append("&Designation=\(designation)".data(using: String.Encoding.utf8)!)
        
        // Request Of Data........
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://httpbin.org/post")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        request.httpBody = postData as Data
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let err = error {
                print(err)
            }
            else {
                //  Data is Converted to JSOn Format..   Serialization
                
                let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.init(rawValue: 0))
                
                
                guard let dict = json as? [String:Any] else {
                    return
                }
                let httpResponse = response as! HTTPURLResponse
               print("My HTTP Response is = = = \(httpResponse)")
                //  print("My Dictionary Data is = = \(dict)")
                
                 guard let form = dict["form"] as? [String:Any] else { return }
              //  print("My Form Data is ==== \(form)")
              //  guard let address = form["address"] as? String else { return }
                
                //print("My Address is ====== \(address)")
                self.dictData = form
               // print("My DictDaTA is \(self.dictData)")
                
            }
        }).resume()
        
    }

    @objc func signUpBtnTap(sender: UIButton) {
    
    let cell = getCell(sender) as! SignUpTableViewCell
        
        userName = cell.userNameTextField.text!
        password = cell.passwordTextField.text!
        confirmPassword = cell.confirmPasswordTextField.text!
        adress = cell.adressTextField.text!
        age = cell.ageTextField.text!
        designation = cell.designationTextField.text!
        fetchDataFromAPI()
      
        cell.userNameTextField.text = ""
        cell.passwordTextField.text = ""
        cell.confirmPasswordTextField.text = ""
        cell.adressTextField.text = ""
        cell.ageTextField.text = ""
        cell.designationTextField.text = ""
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(5), execute: {
        self.myActivityIndicator.stopAnimating()
        
       let signUpScene = self.storyboard?.instantiateViewController(withIdentifier: "DataShowId") as! DataShow
            print(self.dictData)
            signUpScene.userName = self.dictData["UserName"]
        
            signUpScene.password = self.dictData["Password"]
            signUpScene.confirmPassword = self.dictData["ConfirmPassword"]
            signUpScene.adress = self.dictData["Adress"]
            signUpScene.age = self.dictData["Age"]
            signUpScene.designation = self.dictData["Designation"]
        self.navigationController?.pushViewController(signUpScene, animated: true)
        
    })
    
 
    }
    
}
    
    


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpTableViewCellId", for: indexPath) as? SignUpTableViewCell else {
            fatalError("Error in making cell")
            }
        cell.signBtnOutlet.addTarget(self, action: #selector(ViewController.signUpBtnTap), for: .touchUpInside)
      
        return cell
    }
    
    }







