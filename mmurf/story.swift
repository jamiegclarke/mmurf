//
//  story.swift
//  mmurf
//
//  Created by jamie goodrick-clarke on 05/04/2022.
//

import Foundation

class story: UIViewController {
    
    // outlets for story UI
    @IBOutlet weak var sharebutton: UIButton!
    @IBOutlet weak var nextbutton: UIButton!
    
    
    @IBOutlet weak var topartistimg: UIImageView!
    @IBOutlet weak var topartistname: UILabel!
    
    @IBOutlet weak var toppaceimg: UIImageView!
    @IBOutlet weak var toppacesong: UILabel!
    
    @IBOutlet weak var topgenreimg: UIImageView!
    @IBOutlet weak var topgenrename: UILabel!
    
    @IBOutlet weak var topheartrateimg: UIImageView!
    @IBOutlet weak var topheartratesong: UILabel!
    
    
    
    // sets outlets for story
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        topartistname.text = topnameart
        self.topartistimg.loadFrom(URLAddress: topimgart)
        
        toppacesong.text = pacenameart
        self.toppaceimg.loadFrom(URLAddress: paceimgart)
        
        topgenrename.text = topnamegenre
        self.topgenreimg.loadFrom(URLAddress: topimggenre)
        
        topheartratesong.text = topamoheart
        self.topheartrateimg.loadFrom(URLAddress: topimgheart)
        
        
        
        }
    
    //shares to social media
    @IBAction func share(_ sender: Any) {
        
        //hides buttons
        sharebutton.isHidden = true
        nextbutton.isHidden = true
        
        // takes screenshot of screen and shares image
            UIGraphicsBeginImageContextWithOptions(
                  CGSize(width: view.bounds.width, height: view.bounds.height),
                  false,
                  2
              )

            view.layer.render(in: UIGraphicsGetCurrentContext()!)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            
            let image: UIImage = screenshot
            let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
            activityVC.popoverPresentationController?.sourceView = self.view
            self.present(activityVC, animated: true, completion: nil)
        
        
        // unhides button when finished
        sharebutton.isHidden = false
        nextbutton.isHidden = false
        
        
        }
        
    
    
        
}
