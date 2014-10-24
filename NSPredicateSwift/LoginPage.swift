//
//  LoginPage.swift
//  NSPredicateSwift
//
//  Created by pcs20 on 10/24/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

import UIKit

class LoginPage: UIViewController {

    @IBOutlet var emailTextField:UITextField!
    @IBOutlet var passwordTextField:UITextField!
    @IBOutlet var submitButton:UIButton!

    var emailsArray:NSArray!
    var loginAttempts:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginAttempts=0
        emailsArray=["sivajeebattina@paradigmcreatives.com","girishs@mailinator.com","siva.doddi@paradigmcreatives.com"]
        self.passwordTextField.secureTextEntry=true
        
        
        

           }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitButtonClicked(sender:AnyObject){
        loginAttempts=loginAttempts+1
        var regexpression="[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
        
        var SuspendedPredicate=NSPredicate(format:"SELF >=%d",3)
        var emailPredicate=NSPredicate(format:"SELF IN %@",emailsArray)
        var emailSyntaxPredicate=NSPredicate(format:"SELF MATCHES %@",regexpression)
        
        if SuspendedPredicate.evaluateWithObject(loginAttempts)
        {
        
            var alert:UIAlertView=UIAlertView()
            alert.title="Account Suspended"
            alert.message="This account locked for this day"
            alert.addButtonWithTitle("OK")
            
            alert.show()

        
        }
        else if !emailSyntaxPredicate.evaluateWithObject(self.emailTextField.text)
        {
            var alert:UIAlertView=UIAlertView()
            alert.title="Wrong Email Format"
            alert.message="Email is not in a valid format"
            alert.addButtonWithTitle("OK")
            
            alert.show()

        
        
        }
        else if emailPredicate.evaluateWithObject(self.emailTextField.text)
        {
        
            loginSuccess()
        
        }
        else
        {
            var alert:UIAlertView=UIAlertView()
            alert.title="Wrong Login Email!"
            alert.message="This email not existed"
            alert.addButtonWithTitle("OK")
            
            alert.show()
        
        
        }
    }
    
    func loginSuccess(){
    
        var storyBoard=UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
        
        var loginSuccess:LoginSuccess=storyBoard.instantiateViewControllerWithIdentifier("loginSuccess") as LoginSuccess
        self.navigationController?.pushViewController(loginSuccess as UIViewController, animated: true)

    
    }
    

  
}
