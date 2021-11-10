//
//  ViewController.swift
//  RakuIchibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/10.
//

import UIKit
import SDWebImage

class ViewController: UIViewController {


    @IBOutlet weak var selectGenreSegment: UISegmentedControl!
    @IBOutlet weak var resultTableView: UITableView!
    
    private let alamofireProcess = AlamofireProcess()
    
    private var cellContentsArray = [HotelDetailDatas]()

    private let selectGenreResultArray = ["all","onsen","premium"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultTableView.register(UINib(nibName: "TableViewCustomCell", bundle: nil), forCellReuseIdentifier: "ItemDetailCell")
        resultTableView.delegate = self
        resultTableView.dataSource = self
    }

    @IBAction func search(_ sender: UIButton) {
        
        alamofireProcess.getItemDetailDatas(targetGenre: selectGenreResultArray[selectGenreSegment.selectedSegmentIndex]) { result, error in
            
            if error != nil{
                
                return
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {[self] in

                cellContentsArray = []
                cellContentsArray = result!
                resultTableView.reloadData()
            }
        }
    }
    
}

extension ViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return tableView.frame.height / 2.5
    }
}

extension ViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cellContentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailCell", for: indexPath) as! TableViewCustomCell
        
        cell.rankLabel.text = "\(cellContentsArray[indexPath.row].rank ?? "読み込みエラー")位"
        cell.hotelImageView.sd_setImage(with: URL(string: cellContentsArray[indexPath.row].hotelImageUrl!), completed: nil)
        cell.hotelNameLabel.text = cellContentsArray[indexPath.row].hotelName
        cell.middleClassNameLabel.text = cellContentsArray[indexPath.row].middleClassName
        
        return cell
    }
}

