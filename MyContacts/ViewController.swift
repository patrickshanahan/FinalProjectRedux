//
//  ViewController.swift
//  MyContacts
//
//  Created by Charles Konkol on 2016-05-05
//  Copyright © 2016 Chuck Konkol. All rights reserved.
//

import UIKit
//0) Add import for CoreData
import CoreData

class ViewController: UIViewController {
    
   
    @IBOutlet weak var titles: UITextField!
    
    @IBOutlet weak var descrip: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet weak var status: UILabel!
    @IBAction func btnSave(sender: AnyObject) {
        
    //1 Add Save Logic
        
        //**Begin Copy**
        if (contactdb != nil)
        {
            
            contactdb.setValue(titles.text, forKey: "titles")
            contactdb.setValue(descrip.text, forKey: "descrip")
            
        }
        else
        {
            let entityDescription =
            NSEntityDescription.entityForName("Contact",inManagedObjectContext: managedObjectContext)
            
            let contact = Contact(entity: entityDescription!,
                insertIntoManagedObjectContext: managedObjectContext)
            
            contact.titles = titles.text!
            contact.descrip = descrip.text!
           
        }
        var error: NSError?
        do {
            try managedObjectContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        
        if let err = error {
            status.text = err.localizedFailureReason
        } else {
            self.dismissViewControllerAnimated(false, completion: nil)
            
        }
        //**End Copy**
    }
    
    @IBAction func btnBack(sender: AnyObject) {
    //2) Dismiss ViewController
        
        //**Begin Copy**
        self.dismissViewControllerAnimated(false, completion: nil)
        //**End Copy**
    }
    
    //3) Add ManagedObject Data Context
    
        //**Begin Copy**
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        //**End Copy**
    
    //4) Add variable contactdb (used from UITableView
    
        //**Begin Copy**
    var contactdb:NSManagedObject!
        //**End Copy**
    
    override func viewDidLoad() {
        super.viewDidLoad()
    //5 Add logic to load db. If contactdb has content that means a row was tapped on UiTableView
        
        //**Begin Copy**
        if (contactdb != nil)
        {
            titles.text = contactdb.valueForKey("titles") as? String
            descrip.text = contactdb.valueForKey("descrip") as? String
            
            btnSave.setTitle("Update", forState: UIControlState.Normal)
        }
        titles.becomeFirstResponder()
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        //Adds tap gesture to view
        view.addGestureRecognizer(tap)


        // Do any additional setup after loading the view, typically from a nib.
        
        //**End Copy**
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //6 Add to hide keyboard
    
    //**Begin Copy**
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches , withEvent:event)
        if (touches.first as UITouch!) != nil {
            DismissKeyboard()
        }
    }
    //**End Copy**
    
    //7 Add to hide keyboard
    
    //**Begin Copy**
    func DismissKeyboard(){
        //forces resign first responder and hides keyboard
        titles.endEditing(true)
        descrip.endEditing(true)
        
    }
    //**End Copy**
    
    //8 Add to hide keyboard
    
    //**Begin Copy**
    func textFieldShouldReturn(textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        return true;
    }
    //**End Copy**
}

