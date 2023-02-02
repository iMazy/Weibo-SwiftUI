//
//  UserViewModel.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import SwiftUI
import Combine

class UserViewModel: ObservableObject {
    
    @Published var users: [User] = []
    
    func getUsers() {

        NetworkManager.shared.getRequest("https://jsonplaceholder.typicode.com/users", type: [User].self) { models in
//            print("getRequest \(models ?? [])")
            self.users = models ?? []
        }
        
//        NetworkManager.shared.getRequest("http://httpbin.org/get", type: String.self) { models in
////            print("getRequest \(models ?? [])")
////            self.users = models ?? []
//        }
        
//        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
//        let urlRequest = URLRequest(url: url)
//
//        let dataTask = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
//            if let err = error {
//                print("Request error: ", err)
//                return
//            }
//
//            guard let response = response as? HTTPURLResponse else { return }
//
//            if response.statusCode == 200 {
//                guard let data = data else { return }
//
//                DispatchQueue.main.async {
//                    do {
//                        let decodedUsers = try JSONDecoder().decode([User].self, from: data)
//                        self.users = decodedUsers
//                    } catch let error {
//                        print("error decoding: ", error)
//                    }
//                }
//            }
//        }
//
//        dataTask.resume()
    }
}

struct User: Identifiable, Decodable {
    
    var id: Int
    var name: String
    var username: String
    var email: String
    var address: Address
    var phone: String
    var website: String
    var company: Company
    
    struct Address: Decodable {
        var street: String
        var suite: String
        var city: String
        var zipcode: String
        var geo: Geo
        
        struct Geo: Decodable {
            var lat: String
            var lng: String
        }
    }
    
    struct Company: Decodable {
        var name: String
        var catchPhrase: String
        var bs: String
    }
}
