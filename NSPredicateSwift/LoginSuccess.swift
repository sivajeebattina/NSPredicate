//
//  LoginSuccess.swift
//  NSPredicateSwift
//
//  Created by pcs20 on 10/24/14.
//  Copyright (c) 2014 Paradigmcreatives. All rights reserved.
//

import UIKit

class LoginSuccess: UIViewController {

    @IBOutlet var firstWordLabel:UILabel!
    @IBOutlet var noOfWordsLabel:UILabel!
    @IBOutlet var endingLetterlabel:UILabel!
    @IBOutlet var lowercaselabel:UILabel!
    
    var inputAlert:UIAlertView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title="Welcome to PCS"
        
        inputAlert=UIAlertView()
        inputAlert.title="Enter String:"
        inputAlert.message=""
        inputAlert.addButtonWithTitle("OK")
        inputAlert.delegate=self
        
        inputAlert.alertViewStyle=UIAlertViewStyle.PlainTextInput
        inputAlert.show()
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func alertView(alertView: UIAlertView!, clickedButtonAtIndex buttonIndex: Int){
        
    
    
        var inputString=inputAlert.textFieldAtIndex(0)!.text
        
        if inputString.utf16Count>0{
            var firstWord=inputString.componentsSeparatedByString(" ")[0]
            var wordRange:NSRange=NSMakeRange(firstWord.utf16Count-1, firstWord.utf16Count)
            
            let myString = firstWord
            let chars = myString[advance(myString.startIndex, myString.utf16Count-1)]
            
            
            self.firstWordLabel.text="First word: \(firstWord)"
            noOfWordsLabel.text="No of words: \(wordCount())"
            endingLetterlabel.text="Ending Letter: \(chars)"
            self.lowercaselabel.text="Lower case: \(inputString.lowercaseString)"
        
        }
        
       
    
    }

    func wordCount()->Int{
    
        var inputStringArray=inputAlert.textFieldAtIndex(0)?.text.componentsSeparatedByString(" ")
    
        return inputStringArray!.count
    }
    
   }
