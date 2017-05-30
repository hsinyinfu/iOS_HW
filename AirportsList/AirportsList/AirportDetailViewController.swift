//
//  AirportDetailViewController.swift
//  AirportsList
//
//  Created by 傅信穎 on 2017/5/30.
//  Copyright © 2017年 傅信穎. All rights reserved.
//

import UIKit

class AirportDetailViewController: UIViewController {

    var airports : [[String:String]]?
    var name : String?
    var iata : String?
    var country : String?
    var servedCity : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for dict in airports! {
            if dict["Airport"]! == name {
                iata = dict["IATA"]!
                country = dict["Country"]!
                servedCity = dict["ServedCity"]!
            }
        }
        
        let nameLabel = self.view.viewWithTag(100) as! UILabel
        let countryLabel = self.view.viewWithTag(101) as! UILabel
        let cityLabel = self.view.viewWithTag(102) as! UILabel
        let airportImageView = self.view.viewWithTag(103) as! UIImageView
        
        nameLabel.text = name
        countryLabel.text! += (" " + country!)
        cityLabel.text! += (" " + servedCity!)
        let imageName = "Airports Data/image/" + iata! + ".jpg"
        airportImageView.image = UIImage(named: imageName )
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
