//
//  Graphing.swift
//  BalloonButton
//
//  Created by NGUYEN, TAM on 2/29/16.
//  Copyright © 2016 BHATTACHARYA, ARUNIMA. All rights reserved.
//

import Foundation
import Charts
import UIKit


class Graphing: UIViewController, ChartViewDelegate{
    
    

    @IBOutlet weak var lineChartView: LineChartView!
    
    var seconds: [Double]!
    var sizesofBalloon: [Double]!
    
    //True to enable the animation, False to stop the animation - globalize later
    var animateTheChart = true
    
    //adding the set point
    let ll = ChartLimitLine(limit: 10.0, label: "Set Point")
    
    //Function to create the chart
    func setChart(dataPoints: [Double], values: [Double]){
        
        lineChartView.noDataText = "You need to provide data for the chart."
        lineChartView.noDataTextDescription = "START THE TIMER"
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i) //takes the value of each data entry
            dataEntries.append(dataEntry)
        }
        
        
        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Sizes of the Balloon")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)
        lineChartView.data = lineChartData
        
        lineChartView.descriptionText = "Sizes of the Balloon per Seconds"
        
        lineChartView.xAxis.labelPosition = .Bottom
        
        //color of the background
        lineChartView.backgroundColor = UIColor (red: 134/255, green: 190/255, blue: 250/255, alpha: 1)
        
        
        //animate the chart
        animationOrNo()
        
        //scale the line chart to fit the screen better.
        lineChartView.setScaleEnabled(true) //scaling both axis
        
        //adding the limit line
        lineChartView.rightAxis.addLimitLine(ll)
        
        
        
        
    }
    
    //function to let the user decide to animate the graoh or no
    func animationOrNo()
    {
        if animateTheChart == true
        {
            lineChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0, easingOption: .EaseInOutCirc)
        }
    }
    
    
    
    @IBAction func saveChart(sender: AnyObject) {
        lineChartView.saveToCameraRoll()
    }
    
    
    
    override func viewDidLoad(){
        
        super.viewDidLoad()
        
        //calling the delegate of the chart title
        lineChartView.delegate = self
        
        //when a value has been selected inside the chart view. Here we print out the seconds and size of balloon selected
        func chartValueSelected(chartView: ChartViewBase, entry: ChartDataEntry, dataSetIndex: Int, highlight: ChartHighlight) {
            print("\(entry.value) in \(seconds[entry.xIndex])")
        }
        
        
        
        //anything additional setup after loading the view here:
        seconds = [0.0, 0.1, 0.2, 0.3, 0.4, 0.5, 0.6]
        sizesofBalloon = [3.0, 6.0, 10.0, 11.0, 13.0, 11.0, 9.0]
        
        setChart(seconds, values: sizesofBalloon)
    }
    
    
    
    
}
