//
//  ViewController.swift
//  RakuIchibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var selectAgeSegment: UISegmentedControl!
    @IBOutlet weak var selsectGenderSegment: UISegmentedControl!
    @IBOutlet weak var resultTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.delegate = self
        resultTableView.dataSource = self
    }

    @IBAction func search(_ sender: UIButton) {
        
        
    }
    
}

extension ViewController:UITableViewDelegate{
    
    
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}

