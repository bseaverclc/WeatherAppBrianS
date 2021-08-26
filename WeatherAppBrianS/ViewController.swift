//
//  ViewController.swift
//  WeatherAppBrianS
//
//  Created by Brian Seaver on 10/11/20.
//  Copyright © 2020 clc.seaver. All rights reserved.
//
// Checking a push

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentDewpoint: UILabel!
    @IBOutlet weak var currentSummary: UILabel!
    @IBOutlet weak var currentTemp: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Step 1 set up api key with latitude and longitude
        if let url = NSURL(string: "https://api.darksky.net/forecast/ae58c5fa7285b492f6a553d200018d9e/42.5917,88.4334"){
            
            // Step 2 parse thru the data
            if let data = NSData(contentsOf: url as URL){
                do{
                    let parsed = try JSONSerialization.jsonObject(with: data as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: AnyObject]
                    
                    // Step 3 temp store data in dictionary
                    let newDict = parsed
                    
                    // step 4 Print out 3 pieces of datain terminal window
                    print(newDict["currently"]!["summary"] as Any)
                    print(newDict["currently"]!["temperature"] as Any)
                    print(newDict["currently"]!["dewPoint"] as Any)
                    
                    self.currentTemp.text = "\(newDict["currently"]!["temperature"]!!)"
                    self.currentSummary.text = "\(newDict["currently"]!["summary"]!!)"
                    self.currentDewpoint.text = "\(newDict["currently"]!["dewPoint"]!!)"
                    
                }
                
                catch let error as NSError{
                    print("JSON parsing Error \(error)")
                }
            }
        }
    }


}

