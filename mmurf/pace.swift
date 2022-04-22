//
//  pace.swift
//  mmurf
//
//  Created by jamie goodrick-clarke on 30/03/2022.
//

import Foundation
import Alamofire
import StravaSwift


// public top pace name and image for story
var paceimgart = ""
var pacenameart = ""

class pace: UIViewController {
    
    
    // outlets for image pace and name
    @IBOutlet weak var songimg: UIImageView!
    @IBOutlet weak var pace: UILabel!
    @IBOutlet weak var name: UILabel!
    
    
    // when view loads, calculate top pace
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var count = 0.0
        for i in 0..<artistIdArr.count{
            
            if paces[i] > count {
                count = paces[i]
            }
            
        }

        // find image and name index associated with pace
        let index = Int(paces.firstIndex(of: count)!)
        songimg.loadFrom(URLAddress: String(artistImageArr[index]))
        
        //display
        pace.text = (round(count).description) + (" MPH")
        name.text = String(songNameArr[index])
        
        //set top for story
        paceimgart = artistImageArr[index]
        pacenameart = songNameArr[index]
        
        }
        
    

                        
}
