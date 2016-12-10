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
    @IBOutlet weak var btnLetsGo: UIButton!
    
    //constant
    let maxNumbers = 7
    
    //Let's go button action listener
    @IBAction func btnClick(sender: UIButton) {
        
        let numTextField = textField.text!
        //checks for empty textfield
        if  numTextField != ""{
            self.textField.resignFirstResponder() //removes the hardware keyboard
        }
        else{
            showAlert("Field cannot be empty") //displays alert if the field is empty
        }
    }
    
    
    override func viewDidLoad() {
        
        //keypress action listener for the textfield to enable/disable the button
        textField.addTarget(self, action: #selector(LetsGetStarted.textFieldDidChange(_:)), forControlEvents: UIControlEvents.EditingChanged)
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
    
    //this function is fired when the key is pressed and checks for the empty textfield
    func textFieldDidChange(textField: UITextField) {
        let numTextField = textField.text!
        if numTextField == "" || numTextField == "0" || numTextField == "1" || numTextField == "2" {
            btnLetsGo.enabled = false
            btnLetsGo.tintColor = UIColor.grayColor()
        } else if numTextField.characters.count > maxNumbers{
            showAlert("The number is too big...")
            btnLetsGo.enabled = false
            btnLetsGo.tintColor = UIColor.grayColor()
        }else {
            btnLetsGo.enabled = true
            btnLetsGo.tintColor = UIColor.blueColor()
        }
    }
    
    //this function creates alert to display it to user. This takes message as argument.
    func showAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok!", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    
}

