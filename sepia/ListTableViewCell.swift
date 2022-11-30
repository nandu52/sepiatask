//
//  ListTableViewCell.swift
//  sepia
//
//  Created by Kandula Anand kumar on 30/11/22.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var listView: UIView!
    @IBOutlet weak var petImg: UIImageView!
    @IBOutlet weak var titlelbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.listView.layer.cornerRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
