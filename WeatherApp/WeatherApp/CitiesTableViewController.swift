//
//  CitiesTableViewController.swift
//  WeatherApp
//
//  Created by Rania Arbash on 2025-03-14.
//

import UIKit

class CitiesTableViewController: UITableViewController, UISearchBarDelegate, NetworkingDelegate {
   
    
    
    @IBOutlet var searchBar: UITableView!
    var listOfCites = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    
        
        NetworkingManager.shared.networkingDelegate = self
    }

    // MARK: - Table view data source

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String){
        print(searchText)
        if searchText.isEmpty {
            listOfCites = []
            tableView.reloadData()
        }
        if searchText.count > 2 {
            NetworkingManager.shared.getAllCitiesFromAPI(searchTerm: searchText)

            //
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCites.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        cell.textLabel?.text = listOfCites[indexPath.row]
        return cell
    }
    func networkingDidFinishWithResult(list: [String]) {
        listOfCites = list
        tableView.reloadData()
    }
    
    func networkingDidFail() {
        listOfCites = []
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var alert = UIAlertController(title: "Saving City", message: "Do you want to save this city to your favorit cites", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            // save to db
            CoreDataManager.shared.addNewCityToDB(name: self.listOfCites[indexPath.row])
            self.performSegue(withIdentifier: "toweather", sender: nil)

        }))
        alert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
            // go to weather
            self.performSegue(withIdentifier: "toweather", sender: nil)

            
        }))
        
        present(alert, animated: true)
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       
        if segue.identifier == "toweather"{
            var WVC =   segue.destination as! WeatherViewController
            WVC.selectedCity =  listOfCites[(tableView.indexPathForSelectedRow?.row)!]
        }
        


    }
   

}
