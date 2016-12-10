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
    @IBAction func btnClick(sender: UIButton) {
        if textField.text != ""{
            self.textField.resignFirstResponder()
        }else{
            showAlert("Field cannot be empty")
        }
    }
    
    override func viewDidLoad() {
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
    
    func textFieldDidChange(textField: UITextField) {
        if textField.text == "" {
            btnLetsGo.enabled = false
            btnLetsGo.tintColor = UIColor.grayColor()
        } else {
            btnLetsGo.enabled = true
            btnLetsGo.tintColor = UIColor.blueColor()
        }
    }
    
    func showAlert(message:String){
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }


}

