//
//  JSONCaller.swift
//  iosProject
//
//  Created by Rufina on 01.05.2022.
//

import Foundation

final class APICaller {

    static let shared = APICaller()
    
    struct Constants {
        static let topHeadlinesURL = URL(string: "https://api.thecatapi.com/v1/breeds/search?q=air&x-api-key=4d962ba8-ab05-4347-ad30-b12c816a4ded")
    }
    
    private init() {}
    
//    public func getCharacters(completion: @escaping (Result<Animals, Error>) -> Void) {
//        guard let url = Constants.topHeadlinesURL else {
//            return
//        }
//        
//        let task = URLSession.shared.dataTask(with: url) { data, _, error in
//            if let error = error {
//                completion(.failure(error))
//            }
//            else if let data = data {
//                do {
//                    let result = try JSONDecoder().decode(Animals.self, from: data)
//                    print("Characters: \([result])")
//                    completion(.success(result))
//                } catch  {
//                    completion(.failure(error))
//                }
//            }
//        }
//        task.resume()
//    }

}

struct APIResponse: Codable {
    let results: [Animals]
}

struct Animals: Codable {
    let name: String
    let temperament: String?
    let description: String?
    let adaptability: Int?
    let child_friendly: Int?
    let dog_friendly: Int?
    let origin: String?
    let reference_image_id: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case temperament = "temperament"
        case description = "description"
        case adaptability = "adaptability"
        case child_friendly = "child_friendly"
        case dog_friendly = "dog_friendly"
        case origin = "origin"
        case reference_image_id = "reference_image_id"
    }
}

struct Dogs: Codable {
    
    let name: String
    let description: String?
    let temperament: String?
    let origin: String?
    let reference_image_id: String?
    let life_span: String?
    let bred_for: String?
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case description = "description"
        case temperament = "temperament"
        case origin = "origin"
        case reference_image_id = "reference_image_id"
        case life_span = "life_span"
        case bred_for = "bred_for"
        
    }
}
