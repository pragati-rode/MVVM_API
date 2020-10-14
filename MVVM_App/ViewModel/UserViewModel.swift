//
//  UserViewModel.swift
//  MVVM_App
//
//  Created by Admin on 10/12/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import Alamofire

class UserViewModel {
    weak var vc : ViewController?
    var arrUsers = [UserModel]()
    
    
    func getAllUserDataAF() {
        AF.request("https://jsonplaceholder.typicode.com/todos/").response {response in
            if let data = response.data {
                    do {
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        //print(userResponse)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            
                            self.vc?.tableView.reloadData()
                        }
                      
                    } catch let err{
                        print(err.localizedDescription)
                    }
            }
        }
    }
    
    func getAllUsersData() {
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) { (data, response, error) in
            
            if error == nil {
                if let data = data
                {
                    do {
                        let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                        self.arrUsers.append(contentsOf: userResponse)
                        DispatchQueue.main.async {
                            
                            self.vc?.tableView.reloadData()
                        }
//                        for modelUser in userResponse {
//                            self.arrUsers.append(modelUser)
//                        }
//                        print(self.arrUsers)
                    } catch let err{
                        print(err.localizedDescription)
                    }
                }
            } else {
                print(error?.localizedDescription)
            }
        }.resume()
        
    }
}
