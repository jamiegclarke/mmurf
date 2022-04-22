//
//  genre.swift
//  mmurf
//
//  Created by jamie goodrick-clarke on 03/04/2022.
//

import Foundation
import Charts

// variables top genre image and top name image for story
var topimggenre = ""
var topnamegenre = ""

class genre: UIViewController {
    
    // sets barchart view outlet
    
    @IBOutlet weak var barChartView: BarChartView!
    
    // sets genre labels
    @IBOutlet weak var genreLabel1: UILabel!
    @IBOutlet weak var genreLabel2: UILabel!
    @IBOutlet weak var genreLabel3: UILabel!
    
    // sets images
    @IBOutlet weak var image1: UIImageView!
    @IBOutlet weak var image2: UIImageView!
    @IBOutlet weak var image3: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        findTopGenreFreq()
        genreChart()
        
    }
    
    // finds the top genre and its associated lisentening amount
    func findTopGenreFreq() {
        
        
        let tupleArray = genres.map { ($0, 1) }
        let elementFrequency = Dictionary(tupleArray, uniquingKeysWith: +)
        let max = elementFrequency.values.max()
       
        
        for (key, value) in elementFrequency {
            if value == max {
                // sets top genre to labels
                genreLabel1.text = key.capitalizingFirstLetter()
                genreLabel2.text = key.capitalizingFirstLetter()
                genreLabel3.text = key.capitalizingFirstLetter()
                
                topnamegenre = key.capitalizingFirstLetter()
            }
            
        }
        
    }
        
    // sets genre bar chart
    func genreChart() {
        

        // sorts dictionary from largest to smallest
        let sortedOne = genreIndex.sorted { (first, second) -> Bool in
            return first.value > second.value
        }
        
      
        
        var chartDataEntry = [BarChartDataEntry]()
        
        var genrenames = [String]()
        var genrepaces = [Double]()
        
        // converts dictionary to two arrays
        for (key, value) in sortedOne {
            genrenames.append(key)
            genrepaces.append(value)
            
        }

        // sets top 3 genres to graph
        for i in 0..<sortedOne.count {
                let values = BarChartDataEntry(x: Double(i), y: genrepaces[i])
                chartDataEntry.append(values)
            if i == 2 {
                break
            }
        }
        

        let chartDataSet = BarChartDataSet(entries: chartDataEntry)
        chartDataSet.drawValuesEnabled = false
        chartDataSet.colors = [NSUIColor.orange]

        let chartMain = BarChartData()
        

        chartMain.append(chartDataSet)
        
        barChartView.xAxis.labelRotationAngle = -20.0
        barChartView.legend.enabled = false
        barChartView.animate(yAxisDuration: 0.5)
        barChartView.data = chartMain
        barChartView.xAxis.valueFormatter = IndexAxisValueFormatter(values: genrenames)
        barChartView.extraTopOffset = 20
        barChartView.leftAxis.labelTextColor = .white
        barChartView.rightAxis.labelTextColor = .white
        barChartView.xAxis.labelTextColor = .white
        
        let imgind2 = Int(paces.firstIndex(of: paces.sorted(by: >)[2])!)
        image1.loadFrom(URLAddress: artistImageArr[imgind2])
        image2.loadFrom(URLAddress: artistImageArr[imgind2])
        image3.loadFrom(URLAddress: artistImageArr[imgind2])
        
        
        topimggenre = artistImageArr[imgind2]
        
    }

                        
}


// extension of String that allows capitalisation of first char in string
extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
}
