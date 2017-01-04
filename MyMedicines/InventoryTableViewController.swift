//
//  InventoryTableViewController.swift
//  MyMedicines
//
//  Created by Development on 3/01/17.
//  Copyright © 2017 Development. All rights reserved.
//


import UIKit
import CoreData


class InventoryTableViewController : UITableViewController{
    
    var medicines = [MyMedicine]()
    var context:NSManagedObjectContext!

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       let del = UIApplication.shared.delegate as! AppDelegate
        
      context = del.persistentContainer.viewContext
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem
        
        // Uncomment the following line to preserve selection between presentations
         self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchMedicines()
        
    }

    func fetchMedicines() {
        let request : NSFetchRequest<MyMedicine> = MyMedicine.fetchRequest()
        
       let sort = NSSortDescriptor(key: "name", ascending: false)
        request.sortDescriptors = [sort]
        
       let asyncRequest = NSAsynchronousFetchRequest<MyMedicine>(fetchRequest: request) { (result)
           in
           self.medicines = result.finalResult ?? []
           self.tableView.reloadData()
        }
        
       do{
          try context.execute(asyncRequest)
      }catch let error {
           print(error)
        }
    }
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }
        override func numberOfSections(in tableView: UITableView) -> Int {
            // #warning Incomplete implementation, return the number of sections
            return 1

    
}
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return medicines.count
}

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "medicineCell", for: indexPath)
        
        let medicine = medicines[indexPath.row]
        
        
        let nameLabel = cell.viewWithTag(1) as! UILabel
        nameLabel.text = medicine.name
        
        let inLabel = cell.viewWithTag(2) as! UILabel
        inLabel.text = medicine.indication
        
        let prLabel = cell.viewWithTag(3) as! UISegmentedControl
       prLabel.apportionsSegmentWidthsByContent = (medicine.prescription != true)
        
        let desLabel = cell.viewWithTag(4) as!UILabel
        desLabel.text = medicine.descriptions
        
        let exLabel = cell.viewWithTag(5) as!UILabel
        exLabel.text = medicine.expiryDate
        
        
        
        
        
        
        return cell
    }
   
    
    
    
    //VOLGENDE FUNC OM TE DELETEN
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                        let medicine = medicines.remove(at: indexPath.row)
                        context.delete(medicine)
            
            do {
                try context.save()
            } catch let error {
                print(error)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
}

