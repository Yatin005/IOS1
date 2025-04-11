//
//  ViewController.swift
//  FinalTest
//
//  Created by Yatin Parulkar on 2025-04-11.
//

import UIKit

class ViewController: UIViewController, UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var searchBar: UISearchBar!
   
    @IBOutlet weak var resultView: UITableView!
    var searchResults: [Drink] = []
    var selectedDrinkID: String?
        let apiService = APIService()

        override func viewDidLoad() {
            super.viewDidLoad()
            searchBar.delegate = self
            resultView.dataSource = self
            resultView.delegate = self
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            if let searchText = searchBar.text, !searchText.isEmpty {
                Task {
                    do {
                        let results = try await apiService.fetchDrinks(withIngredient: searchText)
                        DispatchQueue.main.async {
                            self.searchResults = results
                            self.resultView.reloadData()
                        }
                    } catch {
                        print("Error fetching drinks: \(error)")
                        DispatchQueue.main.async {
                            // Handle error on the main thread (e.g., show an alert)
                        }
                    }
                }
            }
            searchBar.resignFirstResponder()
        }

        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return searchResults.count
        }

        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let drink = searchResults[indexPath.row]
            cell.textLabel?.text = drink.strDrink
            

            if let imageURLString = drink.strDrinkThumb, let imageURL = URL(string: imageURLString) {
                Task {
                    do {
                        let (data, _) = try await URLSession.shared.data(from: imageURL)
                        if let image = UIImage(data: data) {
                            DispatchQueue.main.async {
                                if self.resultView.indexPath(for: cell) == indexPath {
                                    cell.imageView?.image = image
                                    cell.setNeedsLayout()
                                }
                            }
                        }
                    } catch {
                        print("Error loading image: \(error)")
                        DispatchQueue.main.async {
                            if tableView.indexPath(for: cell) == indexPath {
                                cell.imageView?.image = UIImage(systemName: "photo")
                            }
                        }
                    }
                }
            } else {
                cell.imageView?.image = UIImage(systemName: "photo")
            }
            return cell
        }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedDrink = searchResults[indexPath.row]
        selectedDrinkID = selectedDrink.idDrink
        performSegue(withIdentifier: "seg", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "seg" {
                if let detailVC = segue.destination as? DetailDrinkViewController, let drinkID = selectedDrinkID {
                    detailVC.drinkID = drinkID
                }
            }
        }
    }
