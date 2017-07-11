//
//  ViewController.swift
//  Tipsy
//
//  Created by Ashwin Mertes on 10/07/2017.
//  Copyright © 2017 Ashwin Mertes. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var bacLabel: UILabel!
    
    fileprivate var numberOfBeers = 0

    @IBAction func addBeer(_ sender: UIButton) {
        numberOfBeers += 1
        
        let bac = calculateBAC().roundTo(places: 5)
        bacLabel.text = "Promille: \(bac)"
    }
    
    func calculateBAC() -> Double {
        let weight = 72.0 // variable
        let differenceBetweenTwoDatesInHours = 0.0; // variable
        
        let nominator = Double(numberOfBeers) * Constants.volumeInCentiliters * Constants.abv * Constants.alcoholInGrams
        let denominator = Constants.widmarkMale * weight * Constants.oneKiloOfBlood // for a male
        let bac = (nominator / denominator) - differenceBetweenTwoDatesInHours * Constants.betaFactor
        
        return bac;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension Double {
    /// Rounds the double to decimal places value
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        
        return (self * divisor).rounded() / divisor
    }
}

