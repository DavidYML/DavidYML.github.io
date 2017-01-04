//
//  AddNewViewController.swift
//  MyMedicines
//
//  Created by Development on 3/01/17.
//  Copyright © 2017 Development. All rights reserved.
//


import UIKit
import CoreData


class AddNewViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var trField: UITextField!
    
    @IBOutlet weak var exField: UITextField!
    
    @IBOutlet weak var prField: UISegmentedControl!
    
    @IBOutlet weak var desField: UITextField!
    
    @IBOutlet weak var imageField: UIImageView!
    
    var context : NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let del = UIApplication.shared.delegate as! AppDelegate
        
        context = del.persistentContainer.viewContext
        
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addPhoto(_ sender: UIButton) {
        UIImagePickerController().self
        
        
    }
    
    
    @IBAction func save(_ sender: UIButton) {
        
        let medicine = NSEntityDescription.insertNewObject(forEntityName: "MyMedicine", into: context) as! MyMedicine
        
    
        medicine.name = nameField.text
        medicine.indication = trField.text
        medicine.expiryDate = exField.text
        medicine.prescription = prField.apportionsSegmentWidthsByContent
        medicine.descriptions = desField.text
        
        
        
        do{
            try context.save()
            dismiss(animated: true , completion: nil)
        }
        catch let error {
            print(error)
        }
    }
    
    @IBAction func backCancel(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
        
    
    
    
    }
    
    
    
    
    
    
