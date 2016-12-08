//
//  ViewController.swift
//  Procore_Sieve_of_Era
//
//  Created by Abdul Raqeeb on 12/7/16.
//  Copyright © 2016 Abdul Raqeeb. All rights reserved.
//

import UIKit

class LetsGetStarted: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    @IBAction func btnClick(sender: UIButton) {
        self.textField.resignFirstResponder()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       // if(segue.identifier == "push")
        //{
           (segue.destinationViewController as! DisplayGrid).data = textField.text
        //}
    }


}

