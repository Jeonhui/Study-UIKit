//
//  SettingsViewController.swift
//  HUFS_global
//
//  Created by 이전희 on 2022/06/25.
//

import UIKit

class SettingsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var verticalStackView: UIStackView!
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    @IBAction func SettingsLoginBtnClicked(_ sender: UIButton) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "showLoginViewController") as! LoginViewController
        self.present(loginVC, animated: true)
    }
    
    let tableArray: [String] = ["A","B","C","D","A","B","C","D","A","B","C","D","A","B","C","D","A","B","C","D","A","B","C","D"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SettingsTableView_Cells") else { fatalError("존재하지 않는 셀") }
        cell.textLabel?.text = tableArray[indexPath.row]
        return cell
    }
    
}

