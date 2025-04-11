//
//  APIService.swift
//  FinalTest
//
//  Created by Yatin Parulkar on 2025-04-11.
//
// APIService.swift
// CocktailApp

import Foundation


class APIService: CocktailServiceProtocol {
    private let baseURL = URL(string: "https://www.thecocktaildb.com/api/json/v1/1/")!

    func fetchDrinks(withIngredient ingredient: String) async throws -> [Drink] {
        guard var components = URLComponents(url: baseURL.appendingPathComponent("filter.php"), resolvingAgainstBaseURL: true) else {
            throw APIError.invalidURL
        }

        components.queryItems = [
            URLQueryItem(name: "i", value: ingredient)
        ]

        guard let url = components.url else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        return try handleResponse(data: data, response: response, decodingType: DrinksResponse.self).drinks ?? []
    }

    func fetchDrinkDetails(withID id: String) async throws -> DrinkDetail? {
        guard var components = URLComponents(url: baseURL.appendingPathComponent("lookup.php"), resolvingAgainstBaseURL: true) else {
            throw APIError.invalidURL
        }

        components.queryItems = [
            URLQueryItem(name: "i", value: id)
        ]

        guard let url = components.url else {
            throw APIError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)
        return try handleResponse(data: data, response: response, decodingType: DrinkDetailsResponse.self).drinks?.first
    }

    private func handleResponse<T: Decodable>(data: Data, response: URLResponse, decodingType: T.Type) throws -> T {
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw APIError.requestFailed(NSError(domain: "HTTPError", code: (response as? HTTPURLResponse)?.statusCode ?? -1, userInfo: nil))
        }
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(decodingType, from: data)
        } catch {
            throw APIError.decodingFailed(error)
        }
    }
}
