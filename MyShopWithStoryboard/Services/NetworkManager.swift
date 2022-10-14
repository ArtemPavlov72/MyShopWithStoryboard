//
//  NetworkManager.swift
//  MyShopWithStoryboard
//
//  Created by Artem Pavlov on 14.10.2022.
//

import Foundation

enum NetworkError: Error {
    case invalidURL
    case noData
    case decodingError
}

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private init() {}
    
    func fetchData(from url: String, completion: @escaping(Result<[Product], NetworkError>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let type = try JSONDecoder().decode([Product].self, from: data)
                DispatchQueue.main.async {
                    completion(.success(type))
                }
            } catch {
                completion(.failure(.decodingError))
            }
        } .resume()
    }
}

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImageWithCatch(from url: URL, completion: @escaping(Data, URLResponse) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, let response = response else {
                print(NetworkError.noData)
                return
            }
            guard url == response.url else { return }
            DispatchQueue.main.async {
                completion(data, response)
            }
        } .resume()
    }
}
