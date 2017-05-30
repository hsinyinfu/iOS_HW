//
//  AirportsTableViewController.swift
//  AirportsList
//
//  Created by 傅信穎 on 2017/5/29.
//  Copyright © 2017年 傅信穎. All rights reserved.
//

import UIKit

class AirportsTableViewController: UITableViewController {
    var airports : [[String:String]]?
    var countries = [String]()
    var countryAirports = [String:[String]]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if let filePath = Bundle.main.path(forResource: "Airports Data/airports", ofType: "plist"){
            airports = NSArray(contentsOfFile: filePath) as? [[String:String]]
        }
        
        var country = [String]()
        for dict in airports! {
            country.append(dict["Country"]!)
        }
        for i in Set(country){
            var airportsOfCertainCountry = [String]()
            countries.append(i)
            for j in airports!{
                if j["Country"]! == i {
                    airportsOfCertainCountry.append(j["Airport"]!)
                }
            }
            countryAirports[i] = airportsOfCertainCountry
        }
        countries.sort()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return countries.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        let country = countries[section]
        for dict in airports!{
            if dict["Country"]! == country {
                count += 1
            }
        }
        return count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let airportName = countryAirports[countries[indexPath.section]]![indexPath.row]
        
        if let cellTitle = cell.contentView.viewWithTag(1000) as? UILabel,
            let cellSubtitle = cell.contentView.viewWithTag(1001) as? UILabel,
            let cellDetail = cell.contentView.viewWithTag(1002) as? UILabel{
            for i in airports!{
                if i["Airport"]! == airportName {
                    cellTitle.text = i["Airport"]!
                    cellSubtitle.text = i["IATA"]!
                    cellDetail.text = i["ServedCity"]!
                    break
                }
            }

        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countries[section]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowDetail" {
            guard let cell = sender as? UITableViewCell else{
                fatalError("Mis-configured storyboard! The sender should be a cell.")
            }
            let destinationVC = segue.destination as! AirportDetailViewController
            destinationVC.name = (cell.contentView.viewWithTag(1000) as! UILabel).text
            destinationVC.airports = airports
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
