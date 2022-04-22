//
//  running.swift
//  mmurf
//
//  Created by jamie goodrick-clarke on 29/03/2022.
//

import Foundation
import Alamofire

// variables for most listened to image and artist
var topnameart = ""
var topimgart = ""
class running: UIViewController {
    
    // outlets for name, image and amount
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var artistimg: UIImageView!
    @IBOutlet weak var amount: UILabel!
    
    override func viewDidLoad() {
        
        // finds most common name
        let tupleArray = artistNameArr.map { ($0, 1) }
        let elementFrequency = Dictionary(tupleArray, uniquingKeysWith: +)
        let max = elementFrequency.values.max()
       
        
        for (key, value) in elementFrequency {
            if value == max {
                topnameart = key
                let imageindex = artistNameArr.firstIndex(of: key)!
                
                // sets most common name, image and amount of times listened
                self.artistimg.loadFrom(URLAddress: artistImageArr[imageindex])
                topimgart = artistImageArr[imageindex]
                self.name.text = key
                self.amount.text = String(value) + " times"
            }
            
        }
    
        

    
    }

                        
}
