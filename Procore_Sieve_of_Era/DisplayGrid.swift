//
//  DisplayGrid.swift
//  Procore_Sieve_of_Era
//
//  Created by Abdul Raqeeb on 12/7/16.
//  Copyright © 2016 Abdul Raqeeb. All rights reserved.
//

import UIKit

class DisplayGrid: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    //variables
    var flagReload: Bool? = false
    var data:String?
    var numbersList:[Bool] = []
    
    
    @IBOutlet weak var cvOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.automaticallyAdjustsScrollViewInsets = false;
        
        //setting up the nav bar
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let button1 = UIBarButtonItem(image: UIImage(named: "magic"), style: .Plain, target: self, action:#selector(DisplayGrid.magicWand))
        self.navigationItem.rightBarButtonItem  = button1
        
        //generating the numbers
        listOfSieveNumbers(Int(data!)!)
    }
    
    //denotes numbers cells to be created
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(data!)!-2
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        //creating the cell
        let cell:NumberCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! NumberCell
        
        //setting the row number plus 2 i.e number to the label in the cell
        cell.Lbl.text = String(indexPath.row+2)
        
        //checking if the number is prime or not
        if numbersList[indexPath.row] {
            
            cell.backgroundColor = UIColor(patternImage: UIImage(named:"bg")!)
            
        }
        else {
            //this function chooses the image based on the flagReload
            imageChooser(cell)
        }
        
        return cell
    }
    
    
    //It is triggered when the cell is clicked. This is for testing purpose and prints on the console
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
    //This function chooses the image based on Magic wand function
    func imageChooser(cell:NumberCell){
        if flagReload == true{
            cell.backgroundColor = UIColor(patternImage: UIImage(named:"wrong1")!)
        }else{
            cell.backgroundColor = UIColor(patternImage: UIImage(named:"wrong")!)
        }
    }
    
    
    //Magic Wand function. This is triggered when the magic wand button is cliced
    func magicWand(){
        
        //Invalidating and reloading the collection view
        cvOutlet.reloadData()
        
        if flagReload == true{
            flagReload = false
        }else{
            flagReload = true
        }
    }
    
    
    //Sieve of Eratosthenes Algorithm
    func listOfSieveNumbers(n:Int){
        
        //setting all integers as prime
        for var i = 2; i <= n; i += 1 {
            numbersList.append(true)
        }
        
        //choosing the non-primes
        for var j = 2; j*j <= n; j += 1 {
            
            //marking muliples of factors as non prime
            if numbersList[j] {
                for var k = 2; k*j <= n; k += 1 {
                    numbersList[k*j-2] = false
                    
                }
            }
        }
    }
    
    //unused code
    /*
     func isPrime(n: Int) -> Bool {
     if n <= 1 {
     return false
     }
     if n <= 3 {
     return true
     }
     var i = 2
     while i*i <= n {
     if n % i == 0 {
     return false
     }
     i = i + 1
     }
     return true
     }
     
     func delayedEffect(indexPath: NSIndexPath,cell:NumberCell){
     let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(indexPath.row) * Int64(NSEC_PER_SEC))
     
     dispatch_after(time, dispatch_get_main_queue()) {
     
     cell.backgroundColor = UIColor.blueColor()
     
     }
     }
     
     */
    
    
    
}