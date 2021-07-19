//
//  APIClient.swift
//  AlbumsApp
//
//  Created by Mykhailo Melnychuk on 17.07.2021.
//

import Foundation

protocol AlbumsAPI {
    
    func getAlbums(completion: @escaping (([Album]?, Error?)->()))
    func getPhotos(for albumId: Int, completion: @escaping (([Photo]?, Error?) -> ()))
    
}

struct APIClient {
    
    var baseURL: String {
        return "https://jsonplaceholder.typicode.com/"
    }
    
}

extension APIClient: AlbumsAPI {
    
    func getPhotos(for albumId: Int, completion: @escaping (([Photo]?, Error?) -> ())) {
        let url = URL(string: baseURL + "albums/" + "\(albumId)/" + "photos")!
        sendRequest(url: url, type: [Photo].self) { (photos, error) in
            completion(photos, error)
        }

    }
    
    func getAlbums(completion: @escaping (([Album]?, Error?) -> ())) {
        let url = URL(string: baseURL + "albums")!
        sendRequest(url: url, type: [Album].self) { (albums, error) in
            completion(albums, error)
        }
    }
    
}

private extension APIClient {
    
    func sendRequest<T: Codable>(url: URL,
                                 type: T.Type,
                                 completion: @escaping (T?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data!)
                completion(decodedData, error)

            } catch {
                completion(nil, error)
            }

        }.resume()
    }
    
}
