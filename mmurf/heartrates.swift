//
//  heartrate.swift
//  mmurf
//
//  Created by jamie goodrick-clarke on 05/04/2022.
//

import Foundation

// set story top hear rate and image
var topamoheart = ""
var topimgheart = ""

class heartrates: UIViewController {
    
    // outlets for heart rate sceen
    @IBOutlet weak var songimg: UIImageView!
    @IBOutlet weak var songTitle: UILabel!
    @IBOutlet weak var bpm: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // finds top heartrate
        let topheart = rate.max()
        
        // finds associated indexes with song name and image
        let index = Int(rate.firstIndex(of: topheart!)!)
        topamoheart = songNameArr[index]
        
        // sets display
        songTitle.text = songNameArr[index]
        bpm.text = String(round(topheart!)) + " BPM"
        songimg.loadFrom(URLAddress: artistImageArr[index])
        topimgheart = artistImageArr[index]
        
        
        }
        
}
