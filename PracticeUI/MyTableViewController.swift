//
//  MyTableViewController.swift
//  PracticeUI
//
//  Created by 박승환 on 4/17/24.
//

import UIKit

class MyTableViewController: UIViewController {
    
    @IBOutlet weak var myTabelVeiw: UITableView!
    
    let friendNames: [String] = ["Henry", "Leeo", "Jay", "Key"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myTabelVeiw.backgroundColor = .blue
        
        // tableView 와 controller 를 연결하기 위한 방법
        myTabelVeiw.delegate = self
        myTabelVeiw.dataSource = self
    }
    
}

// class를 확장하여 아래의 내용과 위의 내용을 분리
extension MyTableViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개의 줄이 들어갈건지 - row
        return friendNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTabelVeiw.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath)
        cell.textLabel?.text = friendNames[indexPath.row]
        return cell
    }
}
