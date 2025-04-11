//
//  DrinkProtocol.swift
//  FinalTest
//
//  Created by Yatin Parulkar on 2025-04-11.
//

import Foundation

protocol CocktailServiceProtocol {
    func fetchDrinks(withIngredient ingredient: String) async throws -> [Drink]
    func fetchDrinkDetails(withID id: String) async throws -> DrinkDetail?
}

enum APIError: Error {
    case invalidURL
    case requestFailed(Error)
    case decodingFailed(Error)
}
