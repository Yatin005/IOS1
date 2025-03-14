//
//  NetworkingManager.swift
//  Week_9_Networking
//
//  Created by Yatin Parulkar on 2025-03-14.
//

import Foundation

class NetworkingManager {
    static var shared = NetworkingManager()
    
    func getAllCitiesFromAPI(serarchTearm: String) {
        
        
        
        let url = URL(string: "https://gd.geobytes.com/AutoCompleteCity?&q=\(serarchTearm)")!
        
        var task = URLSession.shared.dataTask(with:url) { data, response , error in
            
        // check if there is error ==> no data
            
            guard let error = error else{
                print("Network Error")
                return
            }
        // check if the response not between 200 and 300 ===> no data
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Its working")
                return
            }
            // if data is ready
            if let goodData = data {
                var json = String(data: goodData, encoding: .utf8)
                print(json)
            }
            
        }
        task.resume()
    }
}
