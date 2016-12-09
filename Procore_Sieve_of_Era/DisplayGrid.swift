//
//  DisplayGrid.swift
//  Procore_Sieve_of_Era
//
//  Created by Abdul Raqeeb on 12/7/16.
//  Copyright © 2016 Abdul Raqeeb. All rights reserved.
//

import UIKit

class DisplayGrid: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate {
    
    var flagReload: Bool? = false
    var data:String?
    @IBOutlet weak var cvOutlet: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        let button1 = UIBarButtonItem(image: UIImage(named: "magic"), style: .Plain, target: self, action:#selector(DisplayGrid.magicWand))
        self.navigationItem.rightBarButtonItem  = button1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(data!)!
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell:NumberCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! NumberCell
        cell.Lbl.text = String(indexPath.row+1)
        
        if isPrime(indexPath.row+1) {
            
            cell.backgroundColor = UIColor.cyanColor()
            
        }
        else {
            if flagReload == true{
            cell.backgroundColor = UIColor(patternImage: UIImage(named:"wrong1")!)
            }else{
               cell.backgroundColor = UIColor(patternImage: UIImage(named:"wrong")!)
            }
            
        }
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        print("Cell \(indexPath.row) selected")
    }
    
    func magicWand(){

        cvOutlet.reloadData()
        if flagReload == true{
            flagReload = false
        }else{
            flagReload = true
        }
    }
    
    func delayedEffect(indexPath: NSIndexPath,cell:NumberCell){
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(indexPath.row) * Int64(NSEC_PER_SEC))
        
        dispatch_after(time, dispatch_get_main_queue()) {
            // Put your code which should be executed with a delay here
            cell.backgroundColor = UIColor.blueColor()
            
        }
    }
    
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
    
    
}