//
//  NetworkManager.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    init () { }
    
    func getRequest<T: Decodable>(_ urlString: String, type: T.Type, completeHandler: @escaping (_ model: T?)->Void) {
        
        guard let url = URL(string: urlString) else { return }
        let urlRequest = URLRequest(url: url)
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                print("Request error: ", err)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                let jsonString = try? JSONSerialization.jsonObject(with: data)
                print(jsonString)
                
                DispatchQueue.main.async {
                    do {
                        let decodedModel = try JSONDecoder().decode(type.self, from: data)
                        completeHandler(decodedModel)
                    } catch let error {
                        completeHandler(nil)
                        print("error decoding: ", error)
                    }
                }
            }
        }
        
        dataTask.resume()
    }
    
    func postRequest<T: Decodable>(_ urlString: String, params: [String: Any], type: T.Type, completeHandler: @escaping (_ model: T?)->Void) {
        
        guard let url = URL(string: urlString) else { return }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        //Note : Add the corresponding "Content-Type" and "Accept" header. In this example I had used the application/json.
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        
        urlRequest.httpBody = try! JSONSerialization.data(withJSONObject: params)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                print("Request error: ", err)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                
                let jsonString = try? JSONSerialization.jsonObject(with: data)
                print(jsonString)
                
                DispatchQueue.main.async {
                    do {
                        let decodedModel = try JSONDecoder().decode(type.self, from: data)
                        completeHandler(decodedModel)
                    } catch let error {
                        completeHandler(nil)
                        print("error decoding: ", error)
                    }
                }
            } else {
                print(response)
            }
        }
        
        dataTask.resume()
    }
    
    func fetch<T: Codable>(from urlString: String) async throws -> T {
        guard let url = URL(string: urlString) else  {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
                
        let result = try JSONDecoder().decode(T.self, from: data)
        
        return result
    }
    
    func fetchJson(from urlString: String) async throws {
        guard let url = URL(string: urlString) else  {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let json = try? JSONSerialization.jsonObject(with: data)
        
//        let result = try JSONDecoder().decode(T.self, from: data)
        print("JSONSerialization \(json)")
        
//        return json
    }
}


class UnsplashStore: ObservableObject {

    static let url = URL(string: "http://httpbin.org/get")!
//    var models: [Model] = [] {
//        didSet {
//            print("sent: \(models)")
//            objectWillChange.send(())
//        }
//    }
//    var objectWillChange = PassthroughSubject<Void, Never>()

    func fetch() {
        URLSession.shared.dataTask(with: UnsplashStore.url) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            do {
                let jsonString = try? JSONSerialization.jsonObject(with: data)
                print(jsonString)
//                let models = try Unsplash(data: data)
//                let viewModels = models
//                    .compactMap { $0.user }
//                    .compactMap(Model.init)
//                DispatchQueue.main.async {
//                    self.models = viewModels
//                }
            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
