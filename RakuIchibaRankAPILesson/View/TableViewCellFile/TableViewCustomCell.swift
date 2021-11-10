//
//  TableViewCustomCell.swift
//  RakuIchibaRankAPILesson
//
//  Created by UrataHiroki on 2021/11/10.
//

import UIKit

class TableViewCustomCell: UITableViewCell {

    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var hotelImageView: UIImageView!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var middleClassNameLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
 
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        rankLabel.text = ""
        hotelImageView.image = UIImage(named: "")
        hotelNameLabel.text = ""
        middleClassNameLabel.text = ""
    }
}
