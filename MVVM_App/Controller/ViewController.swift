//
//  ViewController.swift
//  MVVM_App
//
//  Created by Admin on 10/12/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!

    var viewModelUser = UserViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
       // viewModelUser.getAllUsersData()
        tableView.register(UINib(nibName:"UserCell", bundle: nil), forCellReuseIdentifier: "UserCell")
        viewModelUser.getAllUserDataAF()
        // Do any additional setup after loading the view.
       
       
        
    }


}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModelUser.arrUsers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell") as! UserCell
        let userModel = viewModelUser.arrUsers[indexPath.row]
        cell.userModel = userModel
       // cell.userConfiguration()
        return cell
    }

}

